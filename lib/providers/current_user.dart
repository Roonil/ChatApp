import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  final int userId;
  String? token;
  CurrentUser({required this.userId, this.token});

  set setToken(String? token) {
    this.token = token;
    notifyListeners();
  }
}
