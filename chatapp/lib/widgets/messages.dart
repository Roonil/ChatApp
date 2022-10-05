import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import './chat_bubble.dart';

class Messages extends StatefulWidget {
  final List<Message> messages;
  final void Function(int) replyTo;

  const Messages({
    Key? key,
    required this.replyTo,
    required this.messages,
  }) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
          replyTo: widget.replyTo,
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
