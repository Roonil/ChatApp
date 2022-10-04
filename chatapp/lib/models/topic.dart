class Topic {
  final int id = 1;
  final String name;
  final DateTime createdAt = DateTime.now();
  //List<Room> rooms;

  Topic({
    required this.name,
    //required this.rooms,
  });
}
