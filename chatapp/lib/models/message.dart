class Message {
  final int id, userId, receiverId, roomId;
  int? threadId;
  List<int?> responses = [];
  int? responseTo;
  final String body;
  final DateTime createdAt = DateTime.now();

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

  void createThread(int threadId, int replyId) {
    this.threadId = threadId;
    responses.add(replyId);
  }

  void isResponseTo(int parentMessageId) {
    responseTo = parentMessageId;
  }
}
