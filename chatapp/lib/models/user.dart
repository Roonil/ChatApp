import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  final int id = 1;
  final String email, password, role;
  //profile
  final DateTime createdAt = DateTime.now();
  User({
    required this.email,
    required this.password,
    required this.role,
  });
}
