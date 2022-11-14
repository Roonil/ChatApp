import 'package:chatapp/databases/local/messages_db.dart';
import 'package:chatapp/remote/send_message.dart';
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
        body: "First Message from ID 2",
        createdAt: DateTime.now()),
    Message(
        roomId: 1,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: 1,
        threadId: 1,
        id: 2,
        body: "Reply to first Message from ID 1",
        createdAt: DateTime.now()),
    Message(
        roomId: 1,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: null,
        threadId: null,
        id: 3,
        body: "Third, fresh Message from ID 1",
        createdAt: DateTime.now()),
    Message(
        roomId: 2,
        userId: 1,
        receiverId: 2,
        responses: [],
        responseTo: null,
        createdAt: DateTime.now(),
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
      createdAt: DateTime.now(),
      body:
          "From ID 2, Fourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeated",
    ),
  ];
  Messages() {
    MessagesDb.instance.getMessages().then((messages) {
      _messages.addAll(messages);
      notifyListeners();
    });
  }
  void reply(Message to, Message message) {
    to.responses.add(message.id);
    message.responseTo = to.id;
    notifyListeners();
  }

  Message withId(int id) {
    return _messages.firstWhere((message) => message.id == id);
  }

  void add(
      {required String body,
      required int? roomId,
      required int? threadId,
      required int? receiverId,
      required BuildContext context}) async {
    final Message message = await TestSendMessage.sendMessage(
        receiverId: receiverId,
        body: body,
        roomId: roomId,
        threadId: threadId,
        context: context);
    _messages.add(message);
    MessagesDb.instance.addMessage(message);
    notifyListeners();
  }

  List<Message> inRoom(int roomId) {
    return _messages.where((message) => message.roomId == roomId).toList();
  }
}
