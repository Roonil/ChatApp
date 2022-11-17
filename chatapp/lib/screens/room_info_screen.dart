import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/annotations.dart';

import '../providers/current_user.dart';
import '../providers/rooms.dart';
import '../providers/room.dart';
import '../models/user.dart';

class RoomInfoScreen extends StatefulWidget {
  static const routeName = "room-info/";
  final int roomId;
  const RoomInfoScreen({@pathParam required this.roomId, super.key});

  @override
  State<RoomInfoScreen> createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final User? currentUser =
        Provider.of<CurrentUser>(context, listen: false).user;

    final Room room =
        Provider.of<Rooms>(context, listen: false).withId(widget.roomId);

    // final User hostUser = room.host;
    final String hostName = room.hostName;
    // final User hostUser =
    //     Provider.of<Users>(context, listen: false).withId(room.hostId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        title: const Text("Room Information"),
        leading: BackButton(onPressed: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorDark,
                radius: 100,
                child: const FittedBox(
                  child: Icon(Icons.person, size: 150),
                ),
              ),
            ),
            Text(
              room.roomName,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Created By: $hostName",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            room.members.contains(currentUser?.profile.userName)
                ? Container()
                : Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => setState(() {
                        Provider.of<Rooms>(context, listen: false)
                            .joinRoom(room: room, context: context);
                        // Provider.of<Rooms>(context, listen: false).addRoom(
                        //     room.roomName,
                        //     room.description,
                        //     room.topics,
                        //     context);
                        room.addUser(currentUser?.profile.userName ?? "");
                      }),
                      child: const Text(
                        "Join Room",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Members: ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: room.members.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(room.members[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
