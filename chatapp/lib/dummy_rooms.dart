import 'package:chatapp/models/topic.dart';

import 'models/room.dart';

final dummyRooms = [
  Room(
      id: 1,
      hostId: 1,
      title: "Let's learn C++!",
      topics: [Topic(name: "C++")],
      description: "Description 1"),
  Room(
      id: 2,
      hostId: 1,
      title: "Anyone up for a GC?",
      topics: [Topic(name: "C++")],
      description: "Description 1"),
  Room(
      id: 3,
      hostId: 2,
      title: "WTH is going on here??!?",
      topics: [Topic(name: "C++")],
      description: "Description 1"),
];
