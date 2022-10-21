import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/topic.dart';

class Room extends ChangeNotifier {
  final int id, hostId;
  final List<int> membersIds;
  final String description, title;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.membersIds,
    required this.id,
    required this.topics,
    required this.title,
    required this.hostId,
    required this.description,
  }) {
    //print(jsonEncode(topics).toString());
  }

  factory Room.fromJson(dynamic json) {
    List<Topic> topics = [];
    for (var topic in jsonDecode(json['topics'])) {
      topics.add(Topic.fromJson(topic));
    }
    // json = json['room'];
    print(jsonDecode(json['topics']));
    return Room(
        description: json['description'] as String,
        hostId: json['hostId'] as int,
        id: json['id'] as int,
        membersIds: List.from(jsonDecode(json['membersIds'])),
        title: json['title'] as String,
        topics: topics);
  }

  Map toJson() => {
        "id": id,
        "hostId": hostId,
        "membersIds": jsonEncode(membersIds),
        "description": description,
        "title": title,
        "topics": topics.isEmpty ? null : jsonEncode(topics),
        "createdAt": createdAt.toIso8601String()
      };

  void addUser(int userId) {
    if (!membersIds.contains(userId)) {
      membersIds.add(userId);
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
