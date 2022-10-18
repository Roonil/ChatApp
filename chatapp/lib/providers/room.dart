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
  });

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
