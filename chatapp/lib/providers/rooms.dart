import 'package:chatapp/models/topic.dart';
import 'package:flutter/material.dart';

import './users.dart';
import '../models/room.dart';

class Rooms with ChangeNotifier {
  final List<Room> _rooms = [
    Room(
        id: 1,
        hostId: 1,
        title: "Let's learn C++!",
        members: [Users().withId(1)],
        topics: [Topic(name: "C++")],
        description: "Description 1"),
    Room(
        id: 2,
        hostId: 1,
        title: "Anyone up for a GC?",
        members: [Users().withId(1), Users().withId(2)],
        topics: [Topic(name: "C++")],
        description: "Description 1"),
    Room(
        id: 3,
        hostId: 2,
        title: "WTH is going on here??!?",
        members: [Users().withId(3)],
        topics: [Topic(name: "C++")],
        description: "Description 1"),
  ];

  Room at(int index) {
    return _rooms[index];
  }

  int length() {
    return _rooms.length;
  }

  void addRoom(Room room) {
    _rooms.add(room);
    notifyListeners();
  }
}
