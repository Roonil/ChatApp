import 'package:chatapp/providers/profiles.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Users extends ChangeNotifier {
  final List<User> _users = [
    User(
        id: 1,
        email: "anand@gmail.com",
        name: "Anand Verma",
        password: "password",
        role: "admin",
        profile: Profiles().withId(1)),
    User(
        id: 2,
        email: "dpack@gmail.com",
        name: "Dee Pack",
        password: "anotherpass",
        role: "admin",
        profile: Profiles().withId(2)),
    User(
        id: 3,
        email: "hwi@hmail.com",
        name: "Random Name",
        password: "randompass",
        role: "user",
        profile: Profiles().withId(3)),
  ];

  User withId(int id) {
    return _users.firstWhere((user) => user.id == id);
  }
}
