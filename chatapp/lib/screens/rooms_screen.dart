import 'package:chatapp/providers/users.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/rooms.dart';
import '../models/topic.dart';

import '../widgets/rooms_list.dart';
import '../widgets/nav_drawer.dart';
import '../models/room.dart';
import '../widgets/modal_add_new_room.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);
  static const routeName = "/rooms";

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    final Rooms rooms = Provider.of<Rooms>(context);
    void addNewRoom(String title, String description, String topicTitles) {
      List<Topic> topics = [];
      for (String topicTitle in topicTitles.split(',')) {
        topics.add(Topic(name: topicTitle));
      }
      setState(() {
        rooms.addRoom(
          Room(
            title: title,
            description: description,
            members: [Provider.of<Users>(context, listen: false).withId(1)],
            topics: topics,
            hostId: 1,
            id: 4,
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        title: const Text("Rooms"),
        actions: const [Icon(Icons.add)],
      ),
      body: const RoomsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return ModalAddNewRoom(
                  addRoom: addNewRoom,
                );
              }),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
