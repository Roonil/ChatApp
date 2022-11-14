import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../providers/rooms.dart';
import '../widgets/chats/bubble_body.dart';
import '../widgets/chats/messages_list.dart';
import 'package:chatapp/providers/messages.dart';

int generateMessageId() {
  return Random().nextInt(10);
}

class GCMessagesScreen extends StatefulWidget {
  static const routeName = "messages";
  final int roomId;
  //final String roomName;
  const GCMessagesScreen(
      {@PathParam() required this.roomId,
      //  @PathParam() required this.roomName,
      Key? key})
      : super(key: key);

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

// ignore: todo
//TODO: Add threads on top with most activity
  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);
    final String roomName =
        Provider.of<Rooms>(context).withId(widget.roomId).roomName;
    final messageController = TextEditingController();
    final messageListController = ItemScrollController();

    void send() {
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
          //messageListController
          //  .jumpTo(messageListController.position.maxScrollExtent);
        }
        messages.add(
            body: message,
            context: context,
            receiverId: 0,
            roomId: widget.roomId,
            threadId: parentId);

        // messages.add(
        //     Message(
        //       roomId: widget.roomId,
        //       userId: 1,
        //       receiverId: 2,
        //       responses: [],
        //       createdAt: DateTime.now(),
        //       responseTo: parentId,
        //       threadId: threadId,
        //       id: 2,
        //       body: message,
        //     ),
        //     context);
        parentId = null;

        messageListController.jumpTo(index: 0);
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 3,
          leading: BackButton(
            color: Theme.of(context).textTheme.bodySmall?.color,
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
          ),
          title: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () =>
                context.router.push(RoomInfoRouter(roomId: widget.roomId)),
            // onTap: () => Navigator.pushNamed(context, RoomInfoScreen.routeName,
            //     arguments: {'roomId': widget.roomId}),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: MessagesList(
                      messageListController: messageListController,
                      drawReplyBox: drawReplyBox,
                      messages: messages.inRoom(widget.roomId)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  parentId != null
                      ? Flexible(
                          flex: 0,
                          child: Row(
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
                          ),
                        )
                      : Container(),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Theme.of(context).primaryColorLight),
                        color: Theme.of(context)
                            .copyWith(brightness: Brightness.light)
                            .cardColor),
                    child: TextField(
                      // focusNode: FocusNode(
                      //   canRequestFocus: true,
                      // ),
                      onSubmitted: (value) => send(),
                      onEditingComplete: () {},
                      textInputAction: TextInputAction.go,
                      controller: messageController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: send,
                          icon: const Icon(
                            Icons.send,
                          ),
                        ),
                        hintText: "Message",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ]));
  }
}
