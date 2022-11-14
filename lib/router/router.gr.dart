// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../main.dart' as _i1;
import '../screens/gc_messages_screen.dart' as _i2;
import '../screens/login_screen.dart' as _i4;
import '../screens/registration_screen.dart' as _i5;
import '../screens/room_info_screen.dart' as _i3;
import '../screens/rooms_screen.dart' as _i6;
import '../screens/user_screen.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LandingRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    GCMessageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GCMessageRouterArgs>(
          orElse: () =>
              GCMessageRouterArgs(roomId: pathParams.getInt('roomId')));
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.GCMessagesScreen(
          roomId: args.roomId,
          key: args.key,
        ),
      );
    },
    RoomInfoRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RoomInfoRouterArgs>(
          orElse: () =>
              RoomInfoRouterArgs(roomId: pathParams.getInt('roomId')));
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.RoomInfoScreen(
          roomId: args.roomId,
          key: args.key,
        ),
      );
    },
    LoginRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegistrationRouter.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouterArgs>(
          orElse: () => const RegistrationRouterArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.RegistrationScreen(key: args.key),
      );
    },
    RoomsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RoomsScreen(),
      );
    },
    UserRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.UserScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          LandingRouter.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              LoginRouter.name,
              path: 'login',
              parent: LandingRouter.name,
            ),
            _i8.RouteConfig(
              RegistrationRouter.name,
              path: 'register',
              parent: LandingRouter.name,
            ),
            _i8.RouteConfig(
              RoomsRouter.name,
              path: 'rooms/',
              parent: LandingRouter.name,
            ),
            _i8.RouteConfig(
              UserRouter.name,
              path: 'user',
              parent: LandingRouter.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          GCMessageRouter.name,
          path: ':roomId',
        ),
        _i8.RouteConfig(
          RoomInfoRouter.name,
          path: 'room-info/:roomId',
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingRouter extends _i8.PageRouteInfo<void> {
  const LandingRouter({List<_i8.PageRouteInfo>? children})
      : super(
          LandingRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LandingRouter';
}

/// generated route for
/// [_i2.GCMessagesScreen]
class GCMessageRouter extends _i8.PageRouteInfo<GCMessageRouterArgs> {
  GCMessageRouter({
    required int roomId,
    _i9.Key? key,
  }) : super(
          GCMessageRouter.name,
          path: ':roomId',
          args: GCMessageRouterArgs(
            roomId: roomId,
            key: key,
          ),
          rawPathParams: {'roomId': roomId},
        );

  static const String name = 'GCMessageRouter';
}

class GCMessageRouterArgs {
  const GCMessageRouterArgs({
    required this.roomId,
    this.key,
  });

  final int roomId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'GCMessageRouterArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i3.RoomInfoScreen]
class RoomInfoRouter extends _i8.PageRouteInfo<RoomInfoRouterArgs> {
  RoomInfoRouter({
    required int roomId,
    _i9.Key? key,
  }) : super(
          RoomInfoRouter.name,
          path: 'room-info/:roomId',
          args: RoomInfoRouterArgs(
            roomId: roomId,
            key: key,
          ),
          rawPathParams: {'roomId': roomId},
        );

  static const String name = 'RoomInfoRouter';
}

class RoomInfoRouterArgs {
  const RoomInfoRouterArgs({
    required this.roomId,
    this.key,
  });

  final int roomId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'RoomInfoRouterArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRouter extends _i8.PageRouteInfo<void> {
  const LoginRouter()
      : super(
          LoginRouter.name,
          path: 'login',
        );

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRouter extends _i8.PageRouteInfo<RegistrationRouterArgs> {
  RegistrationRouter({_i9.Key? key})
      : super(
          RegistrationRouter.name,
          path: 'register',
          args: RegistrationRouterArgs(key: key),
        );

  static const String name = 'RegistrationRouter';
}

class RegistrationRouterArgs {
  const RegistrationRouterArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegistrationRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.RoomsScreen]
class RoomsRouter extends _i8.PageRouteInfo<void> {
  const RoomsRouter()
      : super(
          RoomsRouter.name,
          path: 'rooms/',
        );

  static const String name = 'RoomsRouter';
}

/// generated route for
/// [_i7.UserScreen]
class UserRouter extends _i8.PageRouteInfo<void> {
  const UserRouter()
      : super(
          UserRouter.name,
          path: 'user',
        );

  static const String name = 'UserRouter';
}
