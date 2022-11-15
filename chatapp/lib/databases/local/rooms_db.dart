import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../providers/room.dart';

class RoomsDb {
  RoomsDb._privateConstructor();
  static final RoomsDb instance = RoomsDb._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'rooms.db');
    // deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("Create Table Rooms(room TEXT, roomId INT)");
  }

  Future<int> addRoom(Room room) async {
    Database db = await instance.database;
    // print(room.toJson());

    return await db.insert('rooms', {
      'room': jsonEncode(room.toJson()),
      'roomId': room.id,
    });
  }

  Future<int> deleteRoomWithId(int id) async {
    Database db = await instance.database;
    return await db.delete('rooms', where: 'roomId = ?', whereArgs: [id]);
  }

  Future<dynamic> getRooms() async {
    Database db = await instance.database;
    List<Room> rooms = [];
    List<Map<String, Object?>> fetchedRooms = await db.query('rooms');

    for (var element in fetchedRooms) {
      rooms.add(Room.fromJson(jsonDecode(element['room'] as String)));
    }

    return rooms;
  }
}
