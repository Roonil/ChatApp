import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/topic.dart';

class Room extends ChangeNotifier {
  final int id, hostId;
  final List<int> members;
  final String description, roomName;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.members,
    required this.id,
    required this.topics,
    required this.roomName,
    required this.hostId,
    required this.description,
  });

  factory Room.fromJson(dynamic json) {
    List<Topic> topics = [];
    for (var topic in jsonDecode(json['topics'])) {
      topics.add(Topic.fromJson(topic));
    }

    return Room(
        description: json['description'] as String,
        hostId: json['hostId'] as int,
        id: json['id'] as int,
        members: json['members'] == [] || json['members'] == null
            ? []
            : List.from(jsonDecode(json['members'].toString())),
        roomName: json['roomName'] as String,
        topics: topics);
  }

  Map toJson() => {
        "id": id,
        "hostId": hostId,
        "members": jsonEncode(members),
        "description": description,
        "roomName": roomName,
        "topics": topics.isEmpty ? null : jsonEncode(topics),
        "createdAt": createdAt.toIso8601String()
      };

  void addUser(int userId) {
    if (!members.contains(userId)) {
      members.add(userId);
    }
    notifyListeners();
  }

  List<String> getTopicsStrings() {
    List<String> strings = [];
    for (var topic in topics) {
      strings.add(topic.name);
    }
    return strings;
  }
}
