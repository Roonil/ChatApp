import 'package:chatapp/providers/users.dart';
import 'package:chatapp/remote/remote_room.dart';
import 'package:flutter/material.dart';

import '../databases/local/rooms_db.dart';
import '../models/topic.dart';
import 'room.dart';

class Rooms with ChangeNotifier {
  final List<Room> _searchRooms = [];
  final List<Room> _rooms = [
    Room(
        id: 100,
        hostId: 100,
        hostName: Users().withId(100).name,
        roomName: "Let's learn C++!",
        members: ["12"],
        topics: [
          Topic(name: "C++", createdAt: DateTime.now()),
          Topic(name: "C", createdAt: DateTime.now())
        ],
        description: "Description 1"),
    Room(
        id: 200,
        hostId: 100,
        hostName: Users().withId(100).name,
        roomName: "Workspace",
        members: ["12", "2"],
        topics: [Topic(name: "Java", createdAt: DateTime.now())],
        description: "Description 1"),
    // Room(
    //     id: 3,
    //     hostId: 2,
    //     roomName: "Python from Scratch",
    //     members: [3],
    //     topics: [Topic(name: "Python", createdAt: DateTime.now())],
    //     description: "Description 1"),
  ];
  Rooms() {
    RoomsDb.instance.getRooms().then((rooms) {
      _rooms.addAll(rooms);

      notifyListeners();
    });
  }
  void getJoinedRooms(BuildContext context) {
    RemoteRoom.getJoinedRooms(context);
  }

  void addToSearch(List<Room> rooms) {
    _searchRooms.addAll(rooms);
  }

  Room withId(int id) {
    return _rooms.firstWhere((room) => room.id == id,
        orElse: () => _searchRooms.firstWhere((room) => room.id == id));
//_searchRooms.firstWhere((room) => room.id == id);
    // return room
  }

  bool isCached(int roomId) {
    for (var room in _searchRooms) {
      if (roomId == room.id) {
        return true;
      }
    }
    return false;
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

  void joinRoom({required Room room, required BuildContext context}) async {
    RemoteRoom.joinRoom(context: context, roomId: room.id);
    RoomsDb.instance.addRoom(room);
    _rooms.add(room);
    notifyListeners();
  }

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

  List<Room> searchListify() {
    return _searchRooms;
  }
}
