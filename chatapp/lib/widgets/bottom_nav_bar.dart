import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final TabsRouter tabsRouter;
  const BottomNavBar({required this.tabsRouter, super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 7,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)
          // BoxShadow(blurRadius: 4, blurStyle: BlurStyle.inner)
        ], borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: GNav(
            selectedIndex: widget.tabsRouter.activeIndex,
            onTabChange: widget.tabsRouter.setActiveIndex,
            color: Theme.of(context).textTheme.titleSmall?.color,
            //color: const Color.fromARGB(255, 255, 255, 255),
            activeColor: Theme.of(context).colorScheme.onPrimary,
            //activeColor: const Color.fromARGB(255, 255, 255, 255),
            tabBackgroundColor:
                Theme.of(context).chipTheme.backgroundColor ?? Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
