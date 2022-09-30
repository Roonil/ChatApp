class Message {
  int id, threadId, userId, receiverId;
  List<Message?> responses;
  Message? responseTo;
  String body;
  DateTime createdAt = DateTime.now();

  Message(this.userId, this.receiverId, this.responses, this.responseTo,
      this.threadId, this.id, this.body);
}
