import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/topic.dart';

import '../providers/rooms.dart';

class ModalAddNewRoom extends StatefulWidget {
  const ModalAddNewRoom({super.key});

  @override
  State<ModalAddNewRoom> createState() => _ModalAddNewRoomState();
}

class _ModalAddNewRoomState extends State<ModalAddNewRoom> {
  final _roomTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _topicsController = TextEditingController();

  void _addRoom() {
    final Rooms rooms = Provider.of<Rooms>(context, listen: false);
    final String roomTitle = _roomTitleController.text;
    final String topics = _topicsController.text;
    final String description = _descriptionController.text;

    if (roomTitle.isEmpty || topics.isEmpty) {
      return;
    }

    List<Topic> listOfTopics = [];
    for (String topic in topics.split(',')) {
      if (topic.trim().isNotEmpty) {
        listOfTopics.add(Topic(name: topic, createdAt: DateTime.now()));
      } else {
        return;
      }
    }
    rooms.addRoom(roomTitle, description, listOfTopics, context);
    // rooms.addRoom(
    //     Room(
    //       title: roomTitle,
    //       description: description,
    //       membersIds: [Provider.of<CurrentUser>(context, listen: false).userId],
    //       topics: listOfTopics,
    //       hostId: 1,
    //       id: 4,
    //     ),
    //     context);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Padding(
          padding: EdgeInsets.all(7),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _roomTitleController,
            minLines: 1,
            maxLines: 2,
            maxLength: 32,
            autocorrect: false,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelText: "Room Name",
              hintText: "Enter Room Name",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _descriptionController,
            minLines: 1,
            maxLines: 5,
            maxLength: 255,
            autocorrect: false,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelText: "Description",
              hintText: "Enter Description",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _topicsController,
            autocorrect: false,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelText: "Tags",
              hintText: "Enter Tags(separated with commas)",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: (() => _addRoom()),
              child: const Text("Create Room"),
            ),
          ),
        ),
      ]),
    );
  }
}
