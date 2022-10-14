import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import './chat_bubble.dart';

class MessagesList extends StatefulWidget {
  final List<Message> messages;
  final void Function(int) drawReplyBox;

  const MessagesList({
    Key? key,
    required this.drawReplyBox,
    required this.messages,
  }) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ChatBubble(
          message: widget.messages[index],
          drawReplyBox: widget.drawReplyBox,
          replyTo:
              //     index == widget.messages.length - 1 || widget.messages.isEmpty
              //         ? null
              widget.messages.firstWhereOrNull(
                  (message) => message.id == widget.messages[index].responseTo),
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
