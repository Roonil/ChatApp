import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import './chat_bubble.dart';

class Messages extends StatelessWidget {
  final List<Message> messages;
  const Messages({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ChatBubble(
          messageBody: messages[index].body,
          messageUserId: messages[index].userId,
        );
      },
      itemCount: messages.length,
    );
  }
}
