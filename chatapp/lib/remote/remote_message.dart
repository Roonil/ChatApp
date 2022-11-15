import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/message.dart';
import '../providers/current_user.dart';
import '../strings/server_host.dart';

class RemoteMessage {
  static Uri url = Uri.parse("${serverHost}message/");

  static void getMessages(
      {required int roomId, required BuildContext context}) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;
    final response = await (http.get(Uri.parse('$url?roomId=$roomId'),
        headers: {'Authorization': token!}));

    final json = jsonDecode(response.body);
    List<Message> messages = [];
    for (var message in json['messages']) {
      messages.add(Message.fromJson(jsonEncode(message)));
    }
  }

  static Future<Message> sendMessage(
      {required String body,
      required int? roomId,
      required int? receiverId,
      required int? threadId,
      required BuildContext context}) async {
    final String? token =
        Provider.of<CurrentUser>(context, listen: false).token;

    final response = await http.post(
        Uri.parse(
            "${url}send?receiverId=${receiverId?.toInt()}&roomId=$roomId&body=$body&threadId=${threadId?.toInt()}"),
        headers: {'Authorization': token!});

    dynamic newJson = jsonDecode(response.body)['message'];
    List<dynamic> st = newJson['room']['topics'] as List<dynamic>;
    newJson['room']['topics'] = "";
    for (var element in st) {
      newJson['room']['topics'] += element + ",";
    }

    newJson['room']['topics'] = newJson['room']['topics']
        .toString()
        .substring(0, newJson['room']['topics'].toString().length - 1);

    if (((newJson['responseTo'])) != null) {
      newJson['responseTo'] = newJson['responseTo']['id'];
    }

    return Message.fromJson(newJson);
  }
}
