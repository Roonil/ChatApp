import 'package:chatapp/screens/rooms_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<StatefulWidget> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.black,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: Color.fromARGB(255, 50, 20, 45)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 50, 20, 45),
            color: Color.fromARGB(255, 255, 255, 255),
            activeColor: Color.fromARGB(255, 255, 255, 255),
            tabBackgroundColor: Color.fromARGB(255, 29, 9, 35),
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(icon: Icons.search, text: "Search"),
              GButton(icon: Icons.settings, text: "Settings"),
              GButton(icon: Icons.local_activity, text: "Activity"),
            ],
          ),
        ),
      ),
    );
    //tab selection index
    // void onTabTapped(int index) {
    //   setState(() {
    //     _currentIndex = index;
    //   });
    // }
  }
}
