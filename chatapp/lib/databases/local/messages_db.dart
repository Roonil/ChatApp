import 'dart:convert';
import 'dart:io';
import 'package:chatapp/models/message.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MessagesDb {
  MessagesDb._privateConstructor();
  static final MessagesDb instance = MessagesDb._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'messages.db');
    // deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("Create Table Messages(message TEXT, roomId INT)");
  }

  Future<dynamic> getMessages() async {
    Database db = await instance.database;
    List<Message> messages = [];
    List<Map<String, Object?>> fetchedMessages = await db.query('messages');
    for (var fetchedMessage in fetchedMessages) {
      messages.add(
          Message.fromJson(jsonDecode(fetchedMessage['message'] as String)));
    }
    return messages;
  }

  Future<int> addMessage(Message message) async {
    Database db = await instance.database;
    //  print(room.toJson());

    return await db.insert('messages', {
      'message': jsonEncode(message.toJson()),
      'roomId': message.roomId,
    });
  }
}
