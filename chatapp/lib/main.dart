import 'package:chatapp/providers/rooms.dart';
import 'package:chatapp/providers/users.dart';
import 'package:chatapp/screens/user_screen.dart';
import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/rooms_screen.dart';

import 'package:provider/provider.dart';
import './screens/gc_messages_screen.dart';

import 'providers/current_user.dart';
import 'providers/profiles.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Rooms()),
        ChangeNotifierProvider(create: (context) => Profiles()),
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(
            create: (context) => CurrentUser(user: Users().withId(1))),
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
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo[200],
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const RoomsScreen(),
      routes: {
        GCMessagesScreen.routeName: (context) => const GCMessagesScreen(),
        UserScreen.routeName: (context) => const UserScreen(),
        RoomsScreen.routeName: (context) => const RoomsScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
