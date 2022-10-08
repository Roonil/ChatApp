import 'package:chatapp/providers/rooms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/room.dart';
import '../models/user.dart';
import '../providers/users.dart';

class RoomInfoScreen extends StatelessWidget {
  static const routeName = "/rooms/room-info";
  const RoomInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int roomId =
        (ModalRoute.of(context)?.settings.arguments as Map)['roomId'];

    final Room room = Provider.of<Rooms>(context, listen: false).withId(roomId);
    final User hostUser =
        Provider.of<Users>(context, listen: false).withId(room.hostId);
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text("Room Information"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Created By: "),
              Text(hostUser.name),
            ],
          ),
          Row(
            children: [
              const Text("Creation Date: "),
              Text(room.createdAt.toString().split(" ")[0])
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Members: "),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Text(room.members[index].name),
                    itemCount: room.members.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
