import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/core/themes/app_theme.dart';
import 'package:smash_fighters_reloaded/features/onboarding/data/datasources/onboarding_item_datasource.dart';
import 'package:smash_fighters_reloaded/features/onboarding/domain/usecases/onboarding_usecase.dart';

@RoutePage()
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(229, 82, 73, 1),
            Color.fromRGBO(42, 82, 190, 1),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: PageView.builder(
          controller: _controller,
          itemCount: onboardingItems.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 70,
                    child: Image.asset(
                      onboardingItems[i].image,
                    ),
                  ),
                  Text(
                    onboardingItems[i].description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: kColorScheme.tertiary,
                          fontSize: 34,
                        ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(currentIndex == onboardingItems.length - 1
                          ? "Get Started"
                          : "Next"),
                      onPressed: () async {
                        if (currentIndex == onboardingItems.length - 1) {
                          GetIt.I.get<OnboardingUseCase>().setOnboarded();
                          AutoRouter.of(ctx).replaceNamed('/');
                        }
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
