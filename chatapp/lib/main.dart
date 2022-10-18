import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import './providers/messages.dart';
import './providers/rooms.dart';
import './providers/users.dart';
import './router/router.gr.dart';
import './screens/user_screen.dart';
import './themes/theme_manager.dart';
import './widgets/bottom_nav_bar.dart';
import './screens/rooms_screen.dart';
import './providers/current_user_id.dart';
import './providers/profiles.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Rooms()),
        ChangeNotifierProvider(create: (context) => Profiles()),
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => Messages()),
        ChangeNotifierProvider(create: (context) => Rooms().at(1)),
        ChangeNotifierProvider(create: (context) => CurrentUserID(userId: 1)),
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
  final appRouter = AppRouter();
  final Color primaryColor = const Color.fromARGB(255, 16, 2, 33);
  final CurrentUserID currentUserID = CurrentUserID(userId: 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: themeDataLight,
      darkTheme: themeDataDark,
      themeMode: ThemeMode.dark,
    );
  }
}

class LandingScreen extends StatelessWidget {
  static const routeName = "/";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => tabsRouter.activeIndex == 1
          ? UserScreen.appBar(context)
          : RoomsScreen.appBar(context),
      routes: const [RoomsRouter(), UserRouter()],
      bottomNavigationBuilder: (context, tabsRouter) =>
          BottomNavBar(tabsRouter: tabsRouter),
    );
  }
}
