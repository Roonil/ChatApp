import 'package:flutter/material.dart';
import '../widgets/messages.dart';
import 'package:chatapp/dummy_messages.dart';

class GCMessagesScreen extends StatelessWidget {
  static const routeName = "/messages";
  const GCMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final int roomId = args['roomId'];
    final String roomName = args['roomName'];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(roomName),
      ),
      body: Stack(
        children: [
          Messages(
            messages: dummyMessages
                .where((dummyMessage) => dummyMessage.roomId == roomId)
                .toList(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Theme.of(context).primaryColorLight),
                  color: Theme.of(context)
                      .copyWith(brightness: Brightness.light)
                      .cardColor),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: "Message", border: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
