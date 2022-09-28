class Room {
  final int id, hostId;
  final String description;
  late DateTime createdAt;

  Room({required this.id, required this.hostId, required this.description}) {
    createdAt = DateTime.now();
  }
}
