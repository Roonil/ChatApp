import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import './chat_bubble.dart';

class Messages extends StatefulWidget {
  final List<Message> messages;
  const Messages({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  @override
  Widget build(BuildContext context) {
    // jumpToLastController.jumpTo(jumpToLastController.position.maxScrollExtent);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ChatBubble(
          messageBody: widget.messages[index].body,
          messageUserId: widget.messages[index].userId,
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
