import 'package:flutter/material.dart';

class Profile extends ChangeNotifier {
  final int id, userId;
  final String bio, userName;
  final DateTime createdAt = DateTime.now();

  Profile({
    required this.id,
    required this.userId,
    required this.bio,
    required this.userName,
  });
}
