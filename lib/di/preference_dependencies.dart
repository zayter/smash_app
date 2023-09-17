import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/features/preferences/data/datasources/preference_local_datasource.dart';
import 'package:smash_fighters_reloaded/features/preferences/data/repositories/preference_repository_impl.dart';
import 'package:smash_fighters_reloaded/features/preferences/domain/repositories/preference_repository.dart';
import 'package:smash_fighters_reloaded/features/onboarding/domain/usecases/onboarding_usecase.dart';

void preferenceDependencies(GetIt sl) {
  sl.registerLazySingleton<PreferenceLocalDataSource>(
      () => PreferenceLocalDataSourceImpl());

  sl.registerLazySingleton<PreferenceRepository>(
      () => PreferenceRepositoryImpl(sl()));

  sl.registerLazySingleton(() => OnboardingUseCase(sl()));
}
