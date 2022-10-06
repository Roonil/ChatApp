import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
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
          messageId: widget.messages[index].id,
          messageBody: widget.messages[index].body,
          messageUserId: widget.messages[index].userId,
          threadId: widget.messages[index].threadId,
          drawReplyBox: widget.drawReplyBox,
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
