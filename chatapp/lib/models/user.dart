import 'package:chatapp/models/profile.dart';

class User {
  final int id;
  final String email, password, role;
  String name;
  final Profile profile;
  final DateTime createdAt = DateTime.now();
  User({
    required this.name,
    required this.profile,
    required this.id,
    required this.email,
    required this.password,
    required this.role,
  });
}
