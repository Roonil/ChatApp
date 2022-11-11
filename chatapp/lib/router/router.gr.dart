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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../main.dart' as _i1;
import '../screens/gc_messages_screen.dart' as _i2;
import '../screens/room_info_screen.dart' as _i3;
import '../screens/rooms_screen.dart' as _i4;
import '../screens/user_screen.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LandingRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    GCMessageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GCMessageRouterArgs>(
          orElse: () =>
              GCMessageRouterArgs(roomId: pathParams.getInt('roomId')));
      return _i6.MaterialPageX<dynamic>(
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
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.RoomInfoScreen(
          roomId: args.roomId,
          key: args.key,
        ),
      );
    },
    RoomsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RoomsScreen(),
      );
    },
    UserRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.UserScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LandingRouter.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              RoomsRouter.name,
              path: 'rooms/',
              parent: LandingRouter.name,
            ),
            _i6.RouteConfig(
              UserRouter.name,
              path: 'user',
              parent: LandingRouter.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          GCMessageRouter.name,
          path: ':roomId',
        ),
        _i6.RouteConfig(
          RoomInfoRouter.name,
          path: 'room-info/:roomId',
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingRouter extends _i6.PageRouteInfo<void> {
  const LandingRouter({List<_i6.PageRouteInfo>? children})
      : super(
          LandingRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'LandingRouter';
}

/// generated route for
/// [_i2.GCMessagesScreen]
class GCMessageRouter extends _i6.PageRouteInfo<GCMessageRouterArgs> {
  GCMessageRouter({
    required int roomId,
    _i7.Key? key,
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

  final _i7.Key? key;

  @override
  String toString() {
    return 'GCMessageRouterArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i3.RoomInfoScreen]
class RoomInfoRouter extends _i6.PageRouteInfo<RoomInfoRouterArgs> {
  RoomInfoRouter({
    required int roomId,
    _i7.Key? key,
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

  final _i7.Key? key;

  @override
  String toString() {
    return 'RoomInfoRouterArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i4.RoomsScreen]
class RoomsRouter extends _i6.PageRouteInfo<void> {
  const RoomsRouter()
      : super(
          RoomsRouter.name,
          path: 'rooms/',
        );

  static const String name = 'RoomsRouter';
}

/// generated route for
/// [_i5.UserScreen]
class UserRouter extends _i6.PageRouteInfo<void> {
  const UserRouter()
      : super(
          UserRouter.name,
          path: 'user',
        );

  static const String name = 'UserRouter';
}
