// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:eduhub/ui/screens/home_screen.dart' as _i1;
import 'package:eduhub/ui/screens/module_screen.dart' as _i2;
import 'package:eduhub/ui/screens/splash_screen.dart' as _i3;
import 'package:eduhub/ui/screens/video_screen.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i6;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ModuleScreen]
class ModuleRoute extends _i5.PageRouteInfo<ModuleRouteArgs> {
  ModuleRoute({
    _i6.Key? key,
    required int subjectId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         ModuleRoute.name,
         args: ModuleRouteArgs(key: key, subjectId: subjectId),
         initialChildren: children,
       );

  static const String name = 'ModuleRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModuleRouteArgs>();
      return _i2.ModuleScreen(key: args.key, subjectId: args.subjectId);
    },
  );
}

class ModuleRouteArgs {
  const ModuleRouteArgs({this.key, required this.subjectId});

  final _i6.Key? key;

  final int subjectId;

  @override
  String toString() {
    return 'ModuleRouteArgs{key: $key, subjectId: $subjectId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ModuleRouteArgs) return false;
    return key == other.key && subjectId == other.subjectId;
  }

  @override
  int get hashCode => key.hashCode ^ subjectId.hashCode;
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}

/// generated route for
/// [_i4.VideoScreen]
class VideoRoute extends _i5.PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    _i6.Key? key,
    required int moduleId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         VideoRoute.name,
         args: VideoRouteArgs(key: key, moduleId: moduleId),
         initialChildren: children,
       );

  static const String name = 'VideoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoRouteArgs>();
      return _i4.VideoScreen(key: args.key, moduleId: args.moduleId);
    },
  );
}

class VideoRouteArgs {
  const VideoRouteArgs({this.key, required this.moduleId});

  final _i6.Key? key;

  final int moduleId;

  @override
  String toString() {
    return 'VideoRouteArgs{key: $key, moduleId: $moduleId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoRouteArgs) return false;
    return key == other.key && moduleId == other.moduleId;
  }

  @override
  int get hashCode => key.hashCode ^ moduleId.hashCode;
}
