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
    //return Container(
    // decoration: const BoxDecoration(
    //   gradient: LinearGradient(
    //       colors: [Colors.blue, Colors.cyan],
    //       begin: Alignment.centerLeft,
    //       end: Alignment.centerRight),
    // ),
    //child:
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            ChatBubble(messageBody: messages[index].body),
          ],
        );
      },
      itemCount: messages.length,
    );
  }
}
