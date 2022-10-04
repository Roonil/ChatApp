class Message {
  int id, threadId, userId, receiverId, roomId;
  List<Message?> responses;
  Message? responseTo;
  String body;
  DateTime createdAt = DateTime.now();

  Message({
    required this.roomId,
    required this.userId,
    required this.receiverId,
    required this.responses,
    required this.responseTo,
    required this.threadId,
    required this.id,
    required this.body,
  });
}
