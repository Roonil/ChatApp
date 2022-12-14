import 'dart:convert';

import 'package:chatapp/providers/current_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/topic.dart';
import '../providers/room.dart';
import 'package:http/http.dart' as http;

import '../providers/rooms.dart';
import '../providers/users.dart';
import '../strings/server_host.dart';

class RemoteRoom {
  static Uri url = Uri.parse("${serverHost}room");

  static void searchRooms(BuildContext context) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    Rooms rooms = Provider.of<Rooms>(context, listen: false);
    final response = await (http
        .get(Uri.parse("$url?search"), headers: {"Authorization": token!}));

    final jsonRooms = jsonDecode(response.body)['rooms'];

    for (Map<String, dynamic> room in jsonRooms) {
      List<dynamic> st = room['topics'] as List<dynamic>;
      room['topics'] = "";
      for (var element in st) {
        room['topics'] += element + ",";
      }

      room['topics'] = room['topics']
          .toString()
          .substring(0, room['topics'].toString().length - 1);
      room['members'] = [room['host']['userName'].toString()];

      if (!rooms.isCached(room['id'])) {
        rooms.addToSearch([Room.fromJson(room)]);
      }
    }
  }

  static void getJoinedRooms(BuildContext context) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    final response = await (http
        .get(Uri.parse("$url?search"), headers: {"Authorization": token!}));
  }

  static void joinRoom(
      {required BuildContext context, required int roomId}) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    final response = await http.post(Uri.parse("$url/join"),
        headers: {"Authorization": token!, 'Content-Type': 'application/json'},
        body: json.encode({'roomId': roomId}));
    print("JOINED");
    print(response.body);
  }

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
            "$url/create?roomName=$roomName&description=$description&topics=${stringTopics.toString()}"),
        headers: {"Authorization": token!});

    Map<String, dynamic> newJson = jsonDecode(response.body)['room'];

    List<dynamic> st = newJson['topics'] as List<dynamic>;
    newJson['topics'] = "";
    for (var element in st) {
      newJson['topics'] += element + ",";
    }
    newJson['topics'] = newJson['topics']
        .toString()
        .substring(0, newJson['topics'].toString().length - 1);

    newJson['members'] = [newJson['host']['userName'].toString()];
    print("TESTTTT");
    print(newJson['host']);
    //TODO:CHANGE TO FULLNAME, remove this line
    newJson['host']['fullName'] = newJson['host']['userName'];
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
