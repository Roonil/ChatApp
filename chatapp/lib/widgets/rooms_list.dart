import 'package:flutter/material.dart';

import '../providers/room.dart';
import '../providers/rooms.dart';
import '../screens/gc_messages_screen.dart';
import 'room_tile.dart';

class RoomsList extends StatelessWidget {
  final Rooms rooms;

  const RoomsList({
    required this.rooms,
    Key? key,
  }) : super(key: key);

  void openRoom(BuildContext context, Room room) {
    Navigator.pushNamed(
      context,
      GCMessagesScreen.routeName,
      arguments: {
        'roomId': room.id,
        'roomName': room.title,
      },
    );
  }

  void deleteRoom(int id) {
    rooms.deleteRoomWithID(id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: const SwipeBackground(
            alignment: Alignment.centerLeft,
          ),
          secondaryBackground:
              const SwipeBackground(alignment: Alignment.centerRight),
          key: ValueKey(rooms.at(index).id),
          onDismissed: (direction) {
            deleteRoom(rooms.at(index).id);
          },
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Confirm Deletion"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("Yes")),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No")),
                ],
              ),
            );
          },
          child: RoomTile(
              room: rooms.at(index),
              deleteRoom: deleteRoom,
              tileKey: index,
              onTap: openRoom),
        );
      },
      itemCount: rooms.length(),
    );
  }
}
