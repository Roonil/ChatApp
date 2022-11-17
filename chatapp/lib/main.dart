import 'package:chatapp/providers/sockets.dart';
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
import 'models/user.dart';
import 'providers/current_user.dart';
import './providers/profiles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Rooms()),
        ChangeNotifierProvider(create: (context) => Profiles()),
        ChangeNotifierProvider(create: (context) => MessagesSocket()),
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => Messages()),
        ChangeNotifierProvider(create: (context) => Rooms().at(1)),
        ChangeNotifierProvider(create: (context) => CurrentUser(userId: 1)),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

class LandingScreen extends StatelessWidget {
  static const routeName = "/";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    currentUser.user == null
        ? null
        : Provider.of<Users>(context, listen: false)
            .addUser(currentUser.user as User);

    return WillPopScope(
      onWillPop: () async => false,
      child: AutoTabsScaffold(
        appBarBuilder: currentUser.token == null
            ? null
            : (context, tabsRouter) => tabsRouter.activeIndex == 1
                ? UserScreen.appBar(context)
                : RoomsScreen.appBar(context),
        routes: currentUser.token == null
            ? [
                RegistrationRouter(),
              ]
            : [const RoomsRouter(), const UserRouter()],
        bottomNavigationBuilder: currentUser.token == null
            ? null
            : (context, tabsRouter) => BottomNavBar(tabsRouter: tabsRouter),
      ),
    );
  }
}
