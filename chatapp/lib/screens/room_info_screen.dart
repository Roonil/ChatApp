import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/annotations.dart';

import '../providers/current_user.dart';
import '../providers/rooms.dart';
import '../providers/room.dart';
import '../models/user.dart';
import '../providers/users.dart';

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
    final Users users = Provider.of<Users>(context, listen: false);
    final int currentUser =
        Provider.of<CurrentUser>(context, listen: false).userId;
    final Room room =
        Provider.of<Rooms>(context, listen: false).withId(widget.roomId);
    final User hostUser =
        Provider.of<Users>(context, listen: false).withId(room.hostId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        title: const Text("Room Information"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                style: const TextStyle(fontSize: 34),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Created By: ${hostUser.name}",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              room.members.contains(currentUser)
                  ? Container()
                  : Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          room.addUser(currentUser);
                        }),
                        child: const Text(
                          "Join Room",
                          style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: room.members.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(users.withId(room.members[index]).name),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
