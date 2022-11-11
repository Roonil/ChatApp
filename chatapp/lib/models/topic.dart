import 'package:flutter/material.dart';

class Topic {
  int id;
  final String name;
  final DateTime createdAt;
  //List<Room> rooms;

  Topic({
    required this.name,
    this.id = 1,
    required this.createdAt,
    //required this.rooms,
  });
  factory Topic.fromJson(dynamic json) {
    return Topic(
        name: json['name'],
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']));
  }
  Map toJson() =>
      {'id': id, 'name': name, 'createdAt': createdAt.toIso8601String()};

  Widget getPill() {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Chip(
        label: Text(name),
        elevation: 3,
      ),
    );
  }
}
