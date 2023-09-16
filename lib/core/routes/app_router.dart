import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/pages/fighter_detail_page.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/pages/fighter_list_page.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/onboarding/presentation/pages/onboarding_page.dart';

part 'app_router.gr.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool onboardedIn = pref.getBool('onboardingFinished') ?? false;
    if (onboardedIn) {
      resolver.next(true);
    } else {
      router.push(const OnboardingRoute());
    }
  }
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      initial: true,
      page: FighterListRoute.page,
      path: '/',
      guards: [OnboardingGuard()],
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: FighterDetailRoute.page,
      path: '/fighters/:id',
      transitionsBuilder: TransitionsBuilders.slideRight,
    ),
  ];
}
