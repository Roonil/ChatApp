import './models/message.dart';

final dummyMessages = [
  Message(
      roomId: 1,
      userId: 2,
      receiverId: 1,
      responses: [],
      responseTo: null,
      threadId: 4,
      id: 4,
      body: "First Message"),
  Message(
      roomId: 1,
      userId: 1,
      receiverId: 2,
      responses: [],
      responseTo: null,
      threadId: 3,
      id: 3,
      body: "Second Message"),
  Message(
      roomId: 1,
      userId: 1,
      receiverId: 2,
      responses: [],
      responseTo: null,
      threadId: 5,
      id: 5,
      body: "Third Message"),
  Message(
      roomId: 2,
      userId: 1,
      receiverId: 2,
      responses: [],
      responseTo: null,
      threadId: 5,
      id: 5,
      body: "Shouldn't appear in any rooms except 2!"),
  Message(
      roomId: 1,
      userId: 2,
      receiverId: 1,
      responses: [],
      responseTo: null,
      threadId: 6,
      id: 6,
      body:
          "Fourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeatedFourth Message but repeated"),
];
