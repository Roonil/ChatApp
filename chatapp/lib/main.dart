import 'dart:convert';

import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
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
import 'providers/current_user.dart';
import './providers/profiles.dart';
import 'models/user.dart';
import 'remote/login.dart';
import 'remote/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final User user = Users().withId(1);

  //String? token;
  // TestRegistration.register(
  //     name: user.name,
  //     email: user.email,
  //     password: "user.password",
  //     username: user.profile.userName);

  // TestLogin.login(password: "user.password", username: user.profile.userName)
  //     .then((response) {
  //   token = jsonDecode(response)["token"];

  //   print(token);
  // });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Rooms()),
        ChangeNotifierProvider(create: (context) => Profiles()),
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
  // final CurrentUser currentUser = CurrentUser(userId: 1);

  // final Color primaryColor = const Color.fromARGB(255, 16, 2, 33);

  @override
  Widget build(BuildContext context) {
    // final CurrentUser currentUser =
    //     Provider.of<CurrentUser>(context, listen: false);
    // final User user =
    //     Provider.of<Users>(context, listen: false).withId(currentUser.userId);
    // TestLogin.login(password: "user.password", username: user.profile.userName)
    //     .then((response) {
    //   String token = jsonDecode(response)["token"];

    //   currentUser.setToken = token;
    // });

    // return MaterialApp(
    //   home: LoginScreen(),
    //   theme: theme,
    //   darkTheme: darkTheme,
    //   themeMode: ThemeMode.dark,
    // );

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
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    // final Users users = Provider.of(context);

    // users
    //     .register(
    //         email: "Test@gmail.com",
    //         name: "Snakes",
    //         password: "Password",
    //         userName: "Kahoot")
    //     .then((token) =>
    //         Provider.of<CurrentUser>(context, listen: false).setToken = token);
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
                // const LoginRouter(),
              ]
            : [const RoomsRouter(), const UserRouter()],
        bottomNavigationBuilder: currentUser.token == null
            ? null
            : (context, tabsRouter) => BottomNavBar(tabsRouter: tabsRouter),
      ),
    );
  }
}
