import 'package:flutter/material.dart';
import '../models/profile.dart';

class Profiles extends ChangeNotifier {
  final List<Profile> _profiles = [
    Profile(
        id: 1,
        userId: 1,
        bio: "Anand's Bio",
        userName: "anandverma458",
        createdAt: DateTime.now()),
    Profile(
        id: 2,
        userId: 2,
        bio: "DPak's Bio",
        userName: "itsDPack",
        createdAt: DateTime.now()),
    Profile(
        id: 3,
        userId: 3,
        bio: "Random Bio",
        userName: "randomThingamabob",
        createdAt: DateTime.now()),
  ];

  Profile withId(int id) {
    return _profiles.firstWhere((profile) => profile.id == id);
  }
}
