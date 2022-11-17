import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/topic.dart';
import '../providers/room.dart';

class RoomTile extends StatefulWidget {
  final Room room;
  final Function(int)? onSwipe;
  final Function(BuildContext, Room) onTap;
  final int tileKey;
  const RoomTile({
    Key? key,
    required this.onSwipe,
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
    var card = Card(
      surfaceTintColor: Theme.of(context).primaryColorLight,
      elevation: 3,
      //color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(0),
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
                      widget.room.roomName,
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.titleMedium?.color),
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
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Theme.of(context).dividerColor,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                  "${widget.room.members.length.toString()} Joined"), // const Text("0 Joined"),
              trailing: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
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
    return Card(
      //surfaceTintColor: Colors.transparent,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      surfaceTintColor: Theme.of(context).primaryColorLight,
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        vertical: 2.5,
        horizontal: 5,
      ),
      child: widget.onSwipe == null
          ? card
          : Dismissible(
              background: const SwipeBackground(
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground:
                  const SwipeBackground(alignment: Alignment.centerRight),
              key: ValueKey(widget.room.id),
              onDismissed: (direction) {
                widget.onSwipe!(widget.room.id);
              },
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Confirm Deletion"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Yes")),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("No")),
                    ],
                  ),
                );
              },
              child: card,
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
      color: Colors.transparent,
      elevation: 0,
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
                color: Theme.of(context).textTheme.caption?.color),
          ),
        ),
      ),
    );
  }
}
