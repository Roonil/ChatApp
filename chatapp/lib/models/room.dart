import './topic.dart';
import './user.dart';

class Room {
  final int id, hostId;
  final List<User> members;
  final String description, title;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.members,
    required this.id,
    required this.topics,
    required this.title,
    required this.hostId,
    required this.description,
  });
}
