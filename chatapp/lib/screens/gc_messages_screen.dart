import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
import '../widgets/messages.dart';
import 'package:chatapp/dummy_messages.dart';

class GCMessagesScreen extends StatefulWidget {
  static const routeName = "/messages";
  const GCMessagesScreen({Key? key}) : super(key: key);

  @override
  State<GCMessagesScreen> createState() => _GCMessagesScreenState();
}

class _GCMessagesScreenState extends State<GCMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final int roomId = args['roomId'];
    final String roomName = args['roomName'];
    final messageController = TextEditingController();

    void sendMessage() {
      final message = messageController.text;
      if (message.isEmpty || message.trim().isEmpty) {
        return;
      }
      setState(() {
        dummyMessages.add(Message(
            roomId: roomId,
            userId: 1,
            receiverId: 2,
            responses: [],
            responseTo: null,
            threadId: 1,
            id: 2,
            body: message));
      });
    }

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
      body: Column(
        children: [
          Flexible(
            child: Messages(
              messages: dummyMessages
                  .where((dummyMessage) => dummyMessage.roomId == roomId)
                  .toList(),
            ),
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
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
