import 'package:flutter/material.dart';

import '../models/user.dart';

class CurrentUser extends ChangeNotifier {
  int userId;
  String? token;
  User? user;
  CurrentUser({required this.userId, this.token, this.user});

  set setId(int userId) {
    this.userId = userId;
    notifyListeners();
  }

  set setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  set setToken(String? token) {
    this.token = token;
    notifyListeners();
  }
}
