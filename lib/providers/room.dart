import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/topic.dart';
import '../models/user.dart';

class Room extends ChangeNotifier {
  final int id, hostId;
  final List<String> members;
  final String description, roomName;
  final String hostName;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.members,
    required this.hostName,
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
    print("!!!!!1");
    print(json['members']);
    print(json);
    return Room(
        hostName: ((json['host']['userName'])),
        description: json['description'] as String,
        hostId: json['hostId'] as int,
        id: json['id'] as int,
        members: json['members'] is String
            ? List<String>.from(jsonDecode(json['members']))
            : List<String>.from((json['members'])),
        // members: json['members'] == [] || json['members'] == null
        //     ? [""]
        //     : ((json['members'])),
        roomName: json['roomName'] as String,
        topics: topics);
  }

  Map toJson() => {
        "id": id,
        "hostName": hostName,
        "hostId": hostId,
        "members": jsonEncode(members),
        "description": description,
        "roomName": roomName,
        "topics": topics.isEmpty ? null : jsonEncode(topics),
        "createdAt": createdAt.toIso8601String()
      };

  void addUser(String userId) {
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
