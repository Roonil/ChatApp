import 'dart:math';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/screens/room_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/chats/bubble_body.dart';
import '../widgets/chats/messages_list.dart';
import 'package:chatapp/providers/messages.dart';

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
    final messages = Provider.of<Messages>(context);
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
          Message replyingTo = messages.withId(parentId as int);
          int messageId = generateMessageId();

          threadId = replyingTo.threadId ?? 1;
          replyingTo.createThread(threadId, messageId);
        }
        messages.add(
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
        parentId = null;
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
                drawReplyBox: drawReplyBox, messages: messages.inRoom(roomId)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                parentId != null
                    ? Row(
                        children: [
                          BubbleBody(
                              isParent: true,
                              body: messages.withId(parentId as int).body),
                          IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              onPressed: () => setState(() {
                                    parentId = null;
                                  })),
                        ],
                      )
                    : Container(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).primaryColorLight),
                      color: Theme.of(context)
                          .copyWith(brightness: Brightness.light)
                          .cardColor),
                  child: Column(
                    children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
