import 'package:chatapp/screens/messages_screen.dart';
import 'package:chatapp/screens/rooms_screen.dart';
import 'package:flutter/material.dart';

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
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      //   primaryColor: const Color.fromARGB(255, 63, 65, 85),
      //   backgroundColor: const Color.fromARGB(255, 44, 45, 56),
      //   canvasColor: const Color.fromARGB(255, 17, 41, 60),
      // ),
      theme: ThemeData(primarySwatch: Colors.indigo).copyWith(
        primaryColor: const Color.fromARGB(255, 63, 65, 85),
        backgroundColor: const Color.fromARGB(255, 44, 45, 56),
        canvasColor: const Color.fromARGB(255, 44, 45, 56),
      ),
      home: const MessagesScreen(),
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
      ),
      body: Column(),
    );
  }
}
