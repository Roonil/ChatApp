import './topic.dart';

class Room {
  final int id, hostId;
  final String description, title;
  final List<Topic> topics;
  final DateTime createdAt = DateTime.now();

  Room({
    required this.id,
    required this.topics,
    required this.title,
    required this.hostId,
    required this.description,
  });
}
