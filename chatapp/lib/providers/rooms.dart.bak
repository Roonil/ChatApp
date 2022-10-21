import '../models/topic.dart';
import 'package:flutter/material.dart';

import 'room.dart';

class Rooms with ChangeNotifier {
  final List<Room> _rooms = [
    Room(
        id: 1,
        hostId: 1,
        title: "Let's learn C++!",
        membersIds: [1],
        topics: [Topic(name: "C++"), Topic(name: "Java")],
        description: "Description 1"),
    Room(
        id: 2,
        hostId: 1,
        title: "Anyone up for a GC?",
        membersIds: [1, 2],
        topics: [Topic(name: "C++")],
        description: "Description 1"),
    Room(
        id: 3,
        hostId: 2,
        title: "WTH is going on here??!?",
        membersIds: [3],
        topics: [Topic(name: "C++")],
        description: "Description 1"),
  ];

  Room withId(int id) {
    return _rooms.firstWhere((room) => room.id == id);
  }

  Room at(int index) {
    return _rooms[index];
  }

  int length() {
    return _rooms.length;
  }

  void deleteRoomWithID(int id) {
    _rooms.removeWhere((room) => room.id == id);
    notifyListeners();
  }

  void addRoom(Room room) {
    _rooms.add(room);
    notifyListeners();
  }

  List<Room> listify() {
    return _rooms;
  }
}
