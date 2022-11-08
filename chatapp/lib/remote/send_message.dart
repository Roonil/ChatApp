import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/message.dart';
import '../providers/current_user.dart';

class TestSendMessage {
  static Uri url = Uri.parse("http://10.0.2.2:3306/api/message/");
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
    print(response.body);
    Map<String, dynamic> newJson = jsonDecode(response.body)['message'];
    List<dynamic> st = newJson['room']['topics'] as List<dynamic>;
    newJson['room']['topics'] = "";
    for (var element in st) {
      newJson['room']['topics'] += element + ",";
    }

    newJson['room']['topics'] = newJson['room']['topics']
        .toString()
        .substring(0, newJson['room']['topics'].toString().length - 1);

    print("NEWJS");
    print(newJson['responseTo']);
    print(newJson);

    if (((newJson['responseTo'])) != null) {
      newJson['responseTo'] = newJson['responseTo']['id'];
    }

    // if (((newJson['room']['responses'])) != null) {
    //   newJson['room']['responses'] = newJson['room']['responses']['id'];
    // }
    return Message.fromJson(newJson);
  }
}
