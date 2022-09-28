import 'package:flutter/material.dart';
import '../dummy_rooms.dart';
import 'package:intl/intl.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(
            vertical: 1,
            horizontal: 5,
          ),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: FittedBox(
                child: Text("IMG"),
              ),
            ),
            title: Text(dummyRooms[index].description),
            subtitle:
                Text(DateFormat.yMMMd().format(dummyRooms[index].createdAt)),
          ),
        );
      },
      itemCount: dummyRooms.length,
    );
  }
}
