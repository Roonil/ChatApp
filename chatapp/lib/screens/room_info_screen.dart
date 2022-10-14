import 'package:chatapp/providers/current_user.dart';
import 'package:chatapp/providers/rooms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/room.dart';
import '../models/user.dart';
import '../providers/users.dart';

class RoomInfoScreen extends StatefulWidget {
  static const routeName = "/rooms/room-info";
  const RoomInfoScreen({super.key});

  @override
  State<RoomInfoScreen> createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final User currentUser = Provider.of<CurrentUser>(context).user;
    final int roomId =
        (ModalRoute.of(context)?.settings.arguments as Map)['roomId'];
    final Room room = Provider.of<Rooms>(context).withId(roomId);
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
      body: Container(
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
                room.title,
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
                    title: Text(room.members[index].name),
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
