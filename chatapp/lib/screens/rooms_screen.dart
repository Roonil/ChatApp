import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import '../providers/room.dart';
import '../providers/rooms.dart';
import '../remote/remote_room.dart';
import '../router/router.gr.dart';
import '../widgets/room_tile.dart';
import '../widgets/rooms_list.dart';

import '../widgets/modal_add_new_room.dart';

class RoomsScreen extends StatefulWidget {
  static AppBar appBar(BuildContext context) {
    final Rooms rooms = Provider.of<Rooms>(context, listen: false);
    rooms.getJoinedRooms(context);
    RemoteRoom.searchRooms(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 3,
      title: const Text("Rooms"),
      actions: [
        IconButton(
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage(
                  barTheme: Theme.of(context).copyWith(
                      appBarTheme: AppBarTheme(
                          color: Theme.of(context).primaryColor, elevation: 3)),
                  builder: (Room room) => RoomTile(
                      onTap: (_, __) =>
                          context.router.push(RoomInfoRouter(roomId: room.id)),
                      onSwipe: null,
                      tileKey: room.id,
                      room: room),
                  filter: (Room room) => [
                    room.roomName,
                  ],
                  items: rooms.searchListify(),
                )),
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
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 10,
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const ModalAddNewRoom(),
                );
              })),
        ),
      ],
    );
  }

  const RoomsScreen({Key? key}) : super(key: key);
  static const routeName = "rooms/";

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    final Rooms rooms = Provider.of<Rooms>(context);
    return RoomsList(rooms: rooms);
  }
}
