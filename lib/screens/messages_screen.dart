import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/messages.dart';
import 'package:chatapp/dummy_messages.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 104, 233),
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Color(0xFFfaee9e),
            fontWeight: FontWeight.bold,
            height: 1,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF12c2e9),
                  Color(0xFFc471ed),
                  Color(0xFFf64f59)
                ]),
          ),
        ),
      ),
      body: Messages(messages: dummyMessages),
    );
  }
}
