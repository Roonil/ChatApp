import 'package:chatapp/models/profile.dart';

class User {
  final int id;
  final String email, password, role;
  String name;
  final Profile profile;
  late DateTime createdAt;
  User(
      {required this.name,
      required this.profile,
      required this.id,
      required this.email,
      required this.password,
      required this.role,
      required this.createdAt
      //this.createdAt = DateTime.now();
      });

  User.clone(User user)
      : this(
            email: user.email,
            id: user.id,
            name: user.name,
            password: user.password,
            profile: user.profile,
            role: user.role,
            createdAt: user.createdAt);
  // User copy(User user) => User(
  //     name: user.name,
  //     profile: user.profile,
  //     id: user.id,
  //     email: user.email,
  //     password: user.password,
  //     role: user.role,
  //     createdAt: user.createdAt);
}
