import 'package:chatapp/screens/rooms_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);
  Widget createNavEntry(
      BuildContext context, String text, IconData icon, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).primaryTextTheme.bodySmall?.color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryTextTheme.bodySmall?.color,
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColorDark,
              child: const Text(
                'Welcome, User!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            createNavEntry(
                context,
                "Rooms",
                Icons.room,
                () => Navigator.pushReplacementNamed(
                    context, RoomsScreen.routeName)),
            createNavEntry(
                context, "Activities", Icons.local_activity, () => null),
            createNavEntry(context, "Topics", Icons.topic, () => null)
          ],
        ));
  }
}
