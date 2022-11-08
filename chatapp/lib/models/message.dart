class Message {
  final int id, userId, roomId;
  final int? receiverId;
  int? responseTo;
  int? threadId;
  List<int?> responses = [];

  final String body;
  final DateTime createdAt;

  Message({
    required this.roomId,
    required this.userId,
    required this.receiverId,
    required this.responses,
    required this.responseTo,
    required this.threadId,
    required this.id,
    required this.createdAt,
    required this.body,
  });
  factory Message.fromJson(dynamic json) {
    print("JSONTIME");
    print(json);
    return Message(
        body: json['body'] as String,
        id: json['id'],
        receiverId: json['receiverId'] == 0 ? null : json['receiverId'],
        responseTo: json['responseTo'] == 0 ? null : json['responseTo'],
        responses: List.from(((json['responses']))),
        roomId: json['roomId'],
        threadId: json['threadId'],
        userId: json['userId'],
        createdAt: DateTime.parse(json['createdAt']));
  }

  Map toJson() => {
        'roomId': roomId,
        'userId': userId,
        'receiverId': receiverId ?? 0,
        'responses': responses,
        'threadId': threadId,
        'responseTo': responseTo,
        'id': id,
        'body': body,
        'createdAt': createdAt.toIso8601String(),
      };

  void createThread(int? threadId, int replyId) {
    this.threadId = threadId;
    responses.add(replyId);
  }

  void isResponseTo(int parentMessageId) {
    responseTo = parentMessageId;
  }
}
