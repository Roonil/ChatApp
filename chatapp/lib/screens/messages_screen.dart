import 'package:flutter/material.dart';
import '../widgets/messages.dart';
import 'package:chatapp/dummy_messages.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = "/messages";
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final int roomId = args['roomId'];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 3,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Messages"),
      ),
      body: Messages(
          messages: dummyMessages
              .where((dummyMessage) => dummyMessage.roomId == roomId)
              .toList()),
    );
  }
}
