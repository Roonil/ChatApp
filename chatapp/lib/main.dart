import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/rooms_screen.dart';
import './screens/gc_messages_screen.dart';

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
      title: 'Flutter Demo',
      // theme: ThemeData(primarySwatch: Colors.indigo).copyWith(
      //   primaryColor: const Color.fromARGB(255, 63, 65, 85),
      //   backgroundColor: const Color.fromARGB(255, 44, 45, 56),
      //   canvasColor: const Color.fromARGB(255, 44, 45, 56),
      // ),
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo[200],
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
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
