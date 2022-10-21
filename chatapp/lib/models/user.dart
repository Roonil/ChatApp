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
