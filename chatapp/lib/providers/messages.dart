import 'package:flutter/cupertino.dart';

import '../models/message.dart';

class Messages extends ChangeNotifier {
  final List<Message> _messages = [
    Message(
        roomId: 1,
        userId: 2,
        receiverId: 1,
        responses: [2, 5],
        responseTo: null,
        threadId: 1,
        id: 1,
        body: "First Message from ID 2"),
    Message(
        roomId: 1,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: 1,
        threadId: 1,
        id: 2,
        body: "Reply to first Message from ID 1"),
    Message(
        roomId: 1,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: null,
        threadId: null,
        id: 3,
        body: "Third, fresh Message from ID 1"),
    Message(
        roomId: 2,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: null,
        threadId: null,
        id: 4,
        body: "Shouldn't appear in any rooms except 2!"),
    Message(
        roomId: 1,
        userId: 2,
        receiverId: 1,
        responses: [],
        responseTo: 2,
        threadId: 1,
        id: 5,
        body:
            "From ID 2, Fourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeated"),
  ];

  void reply(Message to, Message message) {
    to.responses.add(message.id);
    message.responseTo = to.id;
    notifyListeners();
  }

  Message withId(int id) {
    return _messages.firstWhere((message) => message.id == id);
  }

  void add(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  List<Message> inRoom(int roomId) {
    return _messages.where((message) => message.roomId == roomId).toList();
  }
}
