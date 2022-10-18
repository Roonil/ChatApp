import 'package:auto_route/auto_route.dart';
import 'package:chatapp/router/router.gr.dart';
import 'package:flutter/material.dart';

import '../providers/room.dart';
import '../providers/rooms.dart';
import 'room_tile.dart';

class RoomsList extends StatelessWidget {
  final Rooms rooms;

  const RoomsList({
    required this.rooms,
    Key? key,
  }) : super(key: key);

  void openRoom(BuildContext context, Room room) {
    context.router.push(GCMessageRouter(roomId: room.id));
  }

  void deleteRoom(int id) {
    rooms.deleteRoomWithID(id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return RoomTile(
            room: rooms.at(index),
            onSwipe: deleteRoom,
            tileKey: index,
            onTap: openRoom);
      },
      itemCount: rooms.length(),
    );
  }
}
