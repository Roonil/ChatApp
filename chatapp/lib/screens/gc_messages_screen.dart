import 'dart:math';

import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import '../widgets/messages_list.dart';
import 'package:chatapp/dummy_messages.dart';

int generateMessageId() {
  return Random().nextInt(10);
}

class GCMessagesScreen extends StatefulWidget {
  static const routeName = "/messages";
  const GCMessagesScreen({Key? key}) : super(key: key);

  @override
  State<GCMessagesScreen> createState() => _GCMessagesScreenState();
}

class _GCMessagesScreenState extends State<GCMessagesScreen> {
  int? parentId;
  int? threadId;

  void drawReplyBox(int? id) {
    setState(() {
      parentId = id;
    });
  }

//TODO: Add threads on top with most activity
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final int roomId = args['roomId'];
    final String roomName = args['roomName'];
    final messageController = TextEditingController();

    void sendMessage() {
      final message = messageController.text;
      if (message.isEmpty || message.trim().isEmpty) {
        return;
      }
      setState(() {
        if (parentId != null) {
          Message replyingTo =
              dummyMessages.firstWhere((message) => message.id == parentId);
          int messageId = generateMessageId();

          threadId = replyingTo.threadId ?? 1;
          replyingTo.createThread(threadId, messageId);
        }
        dummyMessages.add(
          Message(
            roomId: roomId,
            userId: 1,
            receiverId: 2,
            responses: [],
            responseTo: parentId,
            threadId: threadId,
            id: 2,
            body: message,
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        leading: BackButton(
          color: Theme.of(context).textTheme.bodySmall?.color,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          roomName,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: MessagesList(
              drawReplyBox: drawReplyBox,
              messages: dummyMessages
                  .where((dummyMessage) => dummyMessage.roomId == roomId)
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Theme.of(context).primaryColorLight),
                  color: Theme.of(context)
                      .copyWith(brightness: Brightness.light)
                      .cardColor),
              child: Column(
                children: [
                  parentId != null
                      ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 7),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            dummyMessages
                                .firstWhere((message) => message.id == parentId)
                                .body,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          focusNode: FocusNode(
                            canRequestFocus: true,
                          ),
                          onSubmitted: (value) => sendMessage(),
                          textInputAction: TextInputAction.go,
                          controller: messageController,
                          decoration: const InputDecoration(
                            hintText: "Message",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: sendMessage,
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
