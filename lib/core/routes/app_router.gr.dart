// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FighterListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FighterListPage(),
      );
    },
    FighterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<FighterDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FighterDetailPage(
          key: args.key,
          id: args.id,
          fighter: args.fighter,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [FighterListPage]
class FighterListRoute extends PageRouteInfo<void> {
  const FighterListRoute({List<PageRouteInfo>? children})
      : super(
          FighterListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FighterListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FighterDetailPage]
class FighterDetailRoute extends PageRouteInfo<FighterDetailRouteArgs> {
  FighterDetailRoute({
    Key? key,
    required String id,
    required Fighter fighter,
    List<PageRouteInfo>? children,
  }) : super(
          FighterDetailRoute.name,
          args: FighterDetailRouteArgs(
            key: key,
            id: id,
            fighter: fighter,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'FighterDetailRoute';

  static const PageInfo<FighterDetailRouteArgs> page =
      PageInfo<FighterDetailRouteArgs>(name);
}

class FighterDetailRouteArgs {
  const FighterDetailRouteArgs({
    this.key,
    required this.id,
    required this.fighter,
  });

  final Key? key;

  final String id;

  final Fighter fighter;

  @override
  String toString() {
    return 'FighterDetailRouteArgs{key: $key, id: $id, fighter: $fighter}';
  }
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
