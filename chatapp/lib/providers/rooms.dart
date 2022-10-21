import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import '../models/topic.dart';
import 'room.dart';

class Rooms with ChangeNotifier {
  final List<Room> _rooms = [
    Room(
        id: 1,
        hostId: 1,
        title: "Let's learn C++!",
        membersIds: [1],
        topics: [
          Topic(name: "C++", createdAt: DateTime.now()),
          Topic(name: "Java", createdAt: DateTime.now())
        ],
        description: "Description 1"),
    Room(
        id: 2,
        hostId: 1,
        title: "Anyone up for a GC?",
        membersIds: [1, 2],
        topics: [Topic(name: "C++", createdAt: DateTime.now())],
        description: "Description 1"),
    Room(
        id: 3,
        hostId: 2,
        title: "WTH is going on here??!?",
        membersIds: [3],
        topics: [Topic(name: "C++", createdAt: DateTime.now())],
        description: "Description 1"),
  ];
  Rooms() {
    DatabaseHelper.instance.getRooms().then((rooms) {
      _rooms.addAll(rooms);
      print(rooms);
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

  void deleteRoomWithID(int id) {
    _rooms.removeWhere((room) => room.id == id);
    notifyListeners();
  }

  void addRoom(Room room) {
    _rooms.add(room);
    DatabaseHelper.instance.addRoom(room);
    notifyListeners();
  }

  List<Room> listify() {
    return _rooms;
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'rooms.db');
    deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("CREATION");
    await db.execute("Create Table Rooms(room TEXT)");
  }

  Future<int> addRoom(Room room) async {
    Database db = await instance.database;
    //print(room.toJson());

    return await db.insert('rooms', {'room': jsonEncode(room.toJson())});
  }

  Future<dynamic> getRooms() async {
    Database db = await instance.database;
    List<Room> rooms = [];
    List<Map<String, Object?>> fetchedRooms = await db.query('rooms');
    print(fetchedRooms);
    for (var element in fetchedRooms) {
      //  print(element);
      //var test = jsonDecode(element['room'] as String);
      rooms.add(Room.fromJson(jsonDecode(element['room'] as String)));
    }

    return rooms;
  }
}
