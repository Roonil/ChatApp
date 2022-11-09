import 'package:chatapp/repo/feed_repo.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/messages_screen.dart';
import 'package:chatapp/screens/otp_verification_screen.dart';
import 'package:chatapp/screens/rooms_screen.dart';
import 'package:chatapp/screens/feed_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatapp',
      theme: ThemeData.dark(),
      home: const OtpScreen(),
      routes: {
        RoomsScreen.routeName: (context) => const RoomsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(child: Text(widget.title)),
    );
  }
}
