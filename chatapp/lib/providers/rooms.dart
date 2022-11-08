import 'package:chatapp/remote/remote_room.dart';
import 'package:flutter/material.dart';

import '../databases/local/rooms_db.dart';
import '../models/topic.dart';
import 'room.dart';

class Rooms with ChangeNotifier {
  final List<Room> _rooms = [
    Room(
        id: 1,
        hostId: 1,
        roomName: "Let's learn C++!",
        members: [1],
        topics: [
          Topic(name: "C++", createdAt: DateTime.now()),
          Topic(name: "Java", createdAt: DateTime.now())
        ],
        description: "Description 1"),
    Room(
        id: 2,
        hostId: 1,
        roomName: "Anyone up for a GC?",
        members: [1, 2],
        topics: [Topic(name: "C++", createdAt: DateTime.now())],
        description: "Description 1"),
    Room(
        id: 3,
        hostId: 2,
        roomName: "WTH is going on here??!?",
        members: [3],
        topics: [Topic(name: "C++", createdAt: DateTime.now())],
        description: "Description 1"),
  ];
  Rooms() {
    RoomsDb.instance.getRooms().then((rooms) {
      _rooms.addAll(rooms);
      notifyListeners();
    });
  }

  Room withId(int id) {
    return _rooms.firstWhere((room) => room.id == id);
  }

  Room at(int index) {
    return _rooms[index];
  }

  int length() {
    return _rooms.length;
  }

  void deleteRoomWithID(int id, BuildContext context) {
    _rooms.removeWhere((room) => room.id == id);
    RoomsDb.instance.deleteRoomWithId(id);
    RemoteRoom.deleteRoomWithId(context: context, roomId: id);
    notifyListeners();
  }

  // void addRoom(Room room, BuildContext context) async {
  //   RemoteRoom.createRoom(room: room, context: context);
  //   RoomsDb.instance.addRoom(room);
  //   _rooms.add(room);
  //   notifyListeners();
  // }
  void addRoom(String roomName, String description, List<Topic> topics,
      BuildContext context) async {
    //TODO: ADD TRY BLOCK TO HANDLE ERRORS HERE!

    final Room room = await RemoteRoom.createRoom(
        description: description,
        roomName: roomName,
        topics: topics,
        context: context);

    RoomsDb.instance.addRoom(room);
    _rooms.add(room);
    notifyListeners();
  }

  List<Room> listify() {
    return _rooms;
  }
}
