import 'package:chatapp/providers/profiles.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../models/user.dart';

class Users extends ChangeNotifier {
  static final List<User> _users = [
    User(
        id: 1,
        email: "anand@gmail.com",
        name: "Anand Verma",
        password: "password",
        role: "admin",
        profile: Profiles().withId(1),
        createdAt: DateTime.now()),
    User(
        id: 2,
        email: "dpack@gmail.com",
        name: "Dee Pack",
        password: "anotherpass",
        role: "admin",
        profile: Profiles().withId(2),
        createdAt: DateTime.now()),
    User(
        id: 3,
        email: "hwi@hmail.com",
        name: "Random Name",
        password: "randompass",
        role: "user",
        profile: Profiles().withId(3),
        createdAt: DateTime.now()),
  ];

  User withId(int id) {
    return User.clone(_users.firstWhere((user) => user.id == id));
  }

  void register(User user) {
    _users.add(user);
    notifyListeners();
  }

  User? login(String email, String password) {
    return _users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );
  }
}
