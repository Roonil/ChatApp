import 'package:flutter/material.dart';
import '../widgets/rooms_list.dart';
import '../widgets/nav_drawer.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);
  static const routeName = "/rooms";

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: const RoomsList(),
    );
  }
}
