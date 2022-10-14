import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/topic.dart';
import '../providers/room.dart';

class RoomTile extends StatefulWidget {
  final Room room;
  final Function(int) deleteRoom;
  final Function(BuildContext, Room) onTap;
  final int tileKey;
  const RoomTile({
    Key? key,
    required this.deleteRoom,
    required this.onTap,
    required this.tileKey,
    required this.room,
  }) : super(key: key);

  @override
  State<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => widget.onTap(context, widget.room),
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
                      widget.room.title,
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
                    DateFormat.yMMMd().format(widget.room.createdAt),
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.bodySmall?.color,
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
              title: Text(
                  "${widget.room.members.length.toString()} Joined"), // const Text("0 Joined"),
              trailing: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (Topic topic in widget.room.topics)
                      Flexible(child: topic.getPill())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeBackground extends StatelessWidget {
  final Alignment alignment;
  const SwipeBackground({
    required this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Delete Room",
            style: TextStyle(
                fontSize: 19,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryTextTheme.caption?.color),
          ),
        ),
      ),
    );
  }
}
