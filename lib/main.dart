import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/core/routes/app_router.dart';
import 'package:smash_fighters_reloaded/core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Smash App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
