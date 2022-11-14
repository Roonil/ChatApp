import 'dart:convert';

import 'package:chatapp/providers/current_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/topic.dart';
import '../providers/room.dart';
import 'package:http/http.dart' as http;

import '../providers/users.dart';
import '../strings/server_host.dart';

class RemoteRoom {
  static Uri url = Uri.parse("${serverHost}room/");

  static Future<Room> createRoom({
    required String roomName,
    required String description,
    required List<Topic> topics,
    required BuildContext context,
  }) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    final Users users = Provider.of<Users>(context, listen: false);

    List<String> stringTopics = [];
    for (var topic in topics) {
      stringTopics.add(jsonEncode(topic.toJson()).toString());
    }

    final response = await http.post(
        Uri.parse(
            "${url}create?roomName=$roomName&description=$description&topics=${stringTopics.toString()}"),
        headers: {"Authorization": token!});
    print(response.body);
    Map<String, dynamic> newJson = jsonDecode(response.body)['room'];

    List<dynamic> st = newJson['topics'] as List<dynamic>;
    newJson['topics'] = "";
    for (var element in st) {
      newJson['topics'] += element + ",";
    }
    newJson['topics'] = newJson['topics']
        .toString()
        .substring(0, newJson['topics'].toString().length - 1);
    print(newJson);
    newJson['members'] = [newJson['host']['id']];
    return Room.fromJson(newJson);
  }

  static void deleteRoomWithId(
      {required int roomId, required BuildContext context}) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    final response = await http.delete(
      Uri.parse("${url}delete"),
      body: jsonEncode({"roomId": roomId}),
      headers: {"Authorization": token!, 'Content-Type': 'application/json'},
    );
  }
}
