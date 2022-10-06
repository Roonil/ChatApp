import 'package:flutter/material.dart';

import '../models/user.dart';

class CurrentUser extends ChangeNotifier {
  final User user;
  CurrentUser({required this.user}) {
    notifyListeners();
  }
}
