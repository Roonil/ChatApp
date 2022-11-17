import 'package:chatapp/models/profile.dart';

import '../providers/room.dart';

class User {
  final int id;
  final String email, role;
  String name;
  List<Room> memberships = [];
  final Profile profile;
  late DateTime createdAt;
  User(
      {required this.name,
      required this.profile,
      required this.id,
      required this.email,
      required this.role,
      required this.createdAt
      //this.createdAt = DateTime.now();
      });

  factory User.fromJson(dynamic json) {
    return User(
        createdAt: DateTime.parse(json['createdAt']),
        email: json['email'],
        id: json['id'],
        name: json['userName'],
        profile: Profile(
            bio: json['bio'],
            createdAt: DateTime.parse(json['createdAt']),
            id: json['id'],
            userId: json['id'],
            userName: json['userName']),
        role: json['role']);
  }
  Map toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "id": id,
        "name": name,
        "profile": profile.toJson(),
        "role": role,
      };
  User.clone(User user)
      : this(
            email: user.email,
            id: user.id,
            name: user.name,
            profile: user.profile,
            role: user.role,
            createdAt: user.createdAt);

  void addMembership(Room room) {
    memberships.any((membership) => membership.id == room.id)
        ? null
        : memberships.add(room);
  }
  // User copy(User user) => User(
  //     name: user.name,
  //     profile: user.profile,
  //     id: user.id,
  //     email: user.email,
  //     password: user.password,
  //     role: user.role,
  //     createdAt: user.createdAt);
}
