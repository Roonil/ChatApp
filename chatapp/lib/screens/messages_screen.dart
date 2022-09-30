import 'package:flutter/material.dart';
import '../widgets/messages.dart';
import 'package:chatapp/dummy_messages.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Messages(messages: dummyMessages),
    );
  }
}
