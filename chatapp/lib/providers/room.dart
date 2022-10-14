import 'package:flutter/material.dart';

import '../models/topic.dart';
import '../models/user.dart';

class Room extends ChangeNotifier {
  final int id, hostId;
  final List<User> members;
  final String description, title;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.members,
    required this.id,
    required this.topics,
    required this.title,
    required this.hostId,
    required this.description,
  });

  void addUser(User user) {
    if (!members.contains(user)) {
      members.add(user);
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
