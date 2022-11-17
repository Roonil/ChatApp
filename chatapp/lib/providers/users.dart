import 'dart:convert';

import 'package:chatapp/models/profile.dart';
import 'package:chatapp/providers/profiles.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Users extends ChangeNotifier {
  static final Uri _url = Uri.parse("http://10.0.2.2:3306/api/user/signup");
  static final List<User> _users = [
    User(
        id: 100,
        email: "anandverma458@gmail.com",
        name: "Anand Verma",
        role: "admin",
        profile: Profiles().withId(1),
        createdAt: DateTime.now()),
    User(
        id: 200,
        email: "dpack@gmail.com",
        name: "Deepak Khattar",
        role: "admin",
        profile: Profiles().withId(2),
        createdAt: DateTime.now()),
    // User(
    //     id: 3,
    //     email: "hwi@hmail.com",
    //     name: "Random Name",
    //     role: "user",
    //     profile: Profiles().withId(3),
    //     createdAt: DateTime.now()),
  ];

  User withId(int id) {
    return _users.firstWhere((user) => user.id == id);
    return User.clone(_users.firstWhere((user) => user.id == id));
  }

  Future<String?> register(
      {required String userName,
      required String email,
      required String password,
      required String name}) async {
    final response = await http.post(_url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "userName": userName,
          "password": password,
        }));
    if (response.statusCode == 200) {
      //  print(response.body);
      final params = json.decode(response.body)["user"];
      final User user = User(
          name: name,
          profile: Profile(
              bio: params["bio"],
              createdAt: DateTime.parse(params["createdAt"]),
              id: 1,
              userId: params["id"],
              userName: params["userName"]),
          id: params["id"],
          email: params["email"],
          role: params["role"],
          createdAt: DateTime.parse(params["createdAt"]));
      _users.add(user);

      notifyListeners();
      return params["token"];
    }
    return null;
  }

  void addUser(User user) {
    _users.add(user);
    //TODO: check if commenting notifyListeners breaks anything
    //notifyListeners();
  }

  // User? login(String email, String password) {
  //   return _users.firstWhereOrNull(
  //     (user) => user.email == email && user.password == password,
  //   );
  // }
}
