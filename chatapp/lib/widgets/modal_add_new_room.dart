import 'package:flutter/material.dart';

class ModalAddNewRoom extends StatefulWidget {
  final Function(String, String, String) addRoom;
  const ModalAddNewRoom({required this.addRoom, super.key});

  @override
  State<ModalAddNewRoom> createState() => _ModalAddNewRoomState();
}

class _ModalAddNewRoomState extends State<ModalAddNewRoom> {
  final _roomTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagsController = TextEditingController();

  void _addRoom() {
    final String roomTitle = _roomTitleController.text;
    final String tags = _tagsController.text;
    final String description = _descriptionController.text;

    if (roomTitle.isEmpty || tags.isEmpty) {
      return;
    }

    widget.addRoom(roomTitle, description, tags);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          controller: _tagsController,
          autocorrect: false,
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "Tags",
            hintText: "Enter Tags(separated with commas)",
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
      ),
      ElevatedButton(
        onPressed: (() => _addRoom()),
        child: const Text("Create Room"),
      ),
    ]);
  }
}
