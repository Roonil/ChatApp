class Profile {
  final int id, userId;
  final String userName;
  String bio;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.userId,
    required this.bio,
    required this.userName,
    required this.createdAt,
  });

  Map toJson() => {
        "id": id,
        "userId": userId,
        "bio": bio,
        "userName": userName,
        "createdAt": createdAt.toIso8601String()
      };
}
