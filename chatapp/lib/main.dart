import './models/profile.dart';
import './models/user.dart';
import 'package:provider/provider.dart';

import './screens/gc_messages_screen.dart';
import './screens/rooms_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) =>
              Profile(id: 1, userId: 1, bio: "bio", userName: "userName")),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              User(email: "email", password: "password", role: "role"),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo[200],
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const RoomsScreen(),
      routes: {
        GCMessagesScreen.routeName: (context) => const GCMessagesScreen(),
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
      ),
      body: Column(),
    );
  }
}
