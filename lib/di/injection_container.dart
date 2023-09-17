import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/core/api/api.dart';
import 'package:smash_fighters_reloaded/di/fighter_dependencies.dart';
import 'package:smash_fighters_reloaded/di/preference_dependencies.dart';
import 'package:smash_fighters_reloaded/di/universe_dependencies.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => Api());
  fighterDependencies(sl);
  preferenceDependencies(sl);
  universeDependencies(sl);
}
