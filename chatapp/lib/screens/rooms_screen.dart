import 'package:chatapp/providers/users.dart';
import 'package:chatapp/screens/user_screen.dart';
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
        leading: Builder(builder: ((context) {
          return IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        })),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        title: const Text("Rooms"),
        actions: [
          IconButton(
              onPressed: null,
              //TODO: Implement Search Function
              icon: Icon(
                Icons.search,
                color: Theme.of(context).textTheme.bodySmall?.color,
              )),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
            onPressed: (() => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return ModalAddNewRoom(
                    addRoom: addNewRoom,
                  );
                })),
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, UserScreen.routeName,
                  arguments: {'id': 1}),
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ))
        ],
      ),
      body: const RoomsList(),
    );
  }
}
