import 'package:flutter/material.dart';

class Topic {
  int id;
  final String name;
  final DateTime createdAt = DateTime.now();
  //List<Room> rooms;

  Topic({
    required this.name,
    this.id = 1,
    //required this.rooms,
  });

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
