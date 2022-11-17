import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class CurrentUser extends ChangeNotifier {
  int? userId;
  String? token;
  User? user;
  CurrentUser({this.userId, this.token, this.user}) {
    //_removeSharedPrefToken();
    //_removeSharedPrefUser();
    _getSharedPrefToken();
    _getSharedPrefUser();
    userId = user?.id;
  }

  void _removeSharedPrefToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  void _removeSharedPrefUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  void _getSharedPrefToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    setToken = token;
  }

  void _getSharedPrefUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      print("object");

      final newJson = (jsonDecode(userString));

      newJson['userName'] = newJson['profile']['userName'];
      newJson['bio'] = newJson['profile']['bio'];
      //  newJson['role'] = newJson['profile']['role'];
      user = User.fromJson((newJson));
      print(newJson);
      setUser = user as User;
    }
    print("USE");
    print(user);
  }

  void _setSharedPrefToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token ?? "");
  }

  void _setSharedPrefUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (user != null) {
      await prefs.setString('user', jsonEncode(user?.toJson()));
    }
  }

  set setId(int userId) {
    this.userId = userId;
    notifyListeners();
  }

  set setUser(User user) {
    this.user = user;
    _setSharedPrefUser();
    notifyListeners();
  }

  set setToken(String? token) {
    this.token = token;
    _setSharedPrefToken();
    notifyListeners();
  }
}
