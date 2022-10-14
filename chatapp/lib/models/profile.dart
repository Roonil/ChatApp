<<<<<<< HEAD
class profile{

}
=======
class Profile {
  final int id, userId;
  final String userName;
  String bio;
  final DateTime createdAt = DateTime.now();

  Profile({
    required this.id,
    required this.userId,
    required this.bio,
    required this.userName,
  });
}
>>>>>>> main
