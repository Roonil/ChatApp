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
          //color: Color.fromARGB(255, 106, 96, 151),
          color: Theme.of(context).primaryColor,
          elevation: 1,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
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
                    Text(
                      dummyRooms[index].description,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                //title: Text(dummyRooms[index].description),
                //subtitle:
                //Text(DateFormat.yMMMd().format(dummyRooms[index].createdAt)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMd().format(dummyRooms[index].createdAt),
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white70,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: const Icon(Icons.people),
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
        );
      },
      itemCount: dummyRooms.length,
    );
  }
}