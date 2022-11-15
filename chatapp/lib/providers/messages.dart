import 'package:chatapp/databases/local/messages_db.dart';
import 'package:chatapp/remote/remote_message.dart';
import 'package:flutter/cupertino.dart';

import '../models/message.dart';

class Messages extends ChangeNotifier {
  List<Message> _messages = [
    Message(
        roomId: 100,
        userId: 200,
        receiverId: 100,
        responses: [200, 500],
        responseTo: null,
        threadId: 100,
        id: 100,
        body: "First Message from ID 2",
        createdAt: DateTime.now()),
    Message(
        roomId: 100,
        userId: 100,
        receiverId: 200,
        responses: [],
        responseTo: 100,
        threadId: 100,
        id: 200,
        body: "Reply to first Message from ID 1",
        createdAt: DateTime.now()),
    Message(
        roomId: 100,
        userId: 100,
        receiverId: 200,
        responses: [],
        responseTo: null,
        threadId: null,
        id: 3,
        body: "Third, fresh Message from ID 1",
        createdAt: DateTime.now()),
    Message(
        roomId: 200,
        userId: 100,
        receiverId: 200,
        responses: [],
        responseTo: null,
        createdAt: DateTime.now(),
        threadId: null,
        id: 4,
        body: "Shouldn't appear in any rooms except 2!"),
    Message(
      roomId: 100,
      userId: 200,
      receiverId: 100,
      responses: [],
      responseTo: 200,
      threadId: 100,
      id: 500,
      createdAt: DateTime.now(),
      body:
          "From ID 200, Fourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeated",
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

  void receiveMessage({required Message message}) {
    //TODO: WONT WORK FOR MULTIPLE USERS...
    if (_messages.last.id == message.id) return;
    _messages.add(message);
    MessagesDb.instance.addMessage(message);
    notifyListeners();
  }

  Message withId(int id) {
    return _messages.firstWhere((message) => message.id == id);
  }

  void updateMessages(List<Message> messages) {
    _messages = messages;
    notifyListeners();
  }

  void sendMessage(
      {required String body,
      required int? roomId,
      required int? threadId,
      required int? receiverId,
      required BuildContext context}) async {
    final Message message = await RemoteMessage.sendMessage(
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
