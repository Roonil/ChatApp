import 'package:auto_route/auto_route.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/screens/gc_messages_screen.dart';
import 'package:chatapp/screens/room_info_screen.dart';
import 'package:chatapp/screens/rooms_screen.dart';
import 'package:chatapp/screens/user_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(
    path: LandingScreen.routeName,
    name: 'LandingRouter',
    page: LandingScreen,
    children: [
      AutoRoute(
          path: RoomsScreen.routeName, name: 'RoomsRouter', page: RoomsScreen),
      AutoRoute(
          path: UserScreen.routeName, name: 'UserRouter', page: UserScreen),
    ],
  ),
  AutoRoute(
    path: ':roomId',
    name: 'GCMessageRouter',
    page: GCMessagesScreen,
  ),
  AutoRoute(
      path: "${RoomInfoScreen.routeName}:roomId",
      page: RoomInfoScreen,
      name: 'RoomInfoRouter')
])
class $AppRouter {}
