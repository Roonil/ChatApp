import 'dart:math';

import 'package:chatapp/models/message.dart';
import 'package:chatapp/screens/room_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/messages_list.dart';
import 'package:chatapp/providers/dummy_messages.dart';

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
    final dummyMessages = Provider.of<Messages>(context);
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
          Message replyingTo = dummyMessages.withId(parentId as int);
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
        title: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pushNamed(context, RoomInfoScreen.routeName,
              arguments: {'roomId': roomId}),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                roomName,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: MessagesList(
                drawReplyBox: drawReplyBox,
                messages: dummyMessages.inRoom(roomId)),
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
              child: Row(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Message", border: InputBorder.none),
                  ),
                  FloatingActionButton(
                    onPressed: null,
                    child: Icon(Icons.send),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
