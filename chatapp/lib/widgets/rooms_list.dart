import 'package:chatapp/screens/gc_messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rooms.dart';
import 'package:intl/intl.dart';

class RoomsList extends StatefulWidget {
  const RoomsList({
    Key? key,
  }) : super(key: key);

  @override
  State<RoomsList> createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  @override
  Widget build(BuildContext context) {
    final Rooms rooms = Provider.of<Rooms>(context);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Theme.of(context).primaryColor,
          elevation: 2,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.pushNamed(
                context,
                GCMessagesScreen.routeName,
                arguments: {
                  'roomId': rooms.at(index).id,
                  'roomName': rooms.at(index).title,
                },
              );
            },
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        child: FittedBox(
                          child: Text("IMG"),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          rooms.at(index).title,
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'RobotoCondensed',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium
                                  ?.color),
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMd().format(rooms.at(index).createdAt),
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodySmall
                              ?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  color: Colors.white10,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people_alt_outlined,
                  ),
                  title: const Text("0 Joined"),
                  trailing: Container(
                    width: 50,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: const Text("C++"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: rooms.length(),
    );
  }
}
