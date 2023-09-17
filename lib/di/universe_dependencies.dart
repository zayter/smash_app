import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/features/universes/data/datasources/universe_remote_datasource.dart';
import 'package:smash_fighters_reloaded/features/universes/data/repositories/universe_repository_iml.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/repositories/universe_repository.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/usecases/universes_usecase.dart';

void universeDependencies(GetIt sl) {
  sl.registerLazySingleton<UniverseRemoteDataSource>(
      () => UniverseRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<UniverseRepository>(
      () => UniverseRepositoryImpl(sl()));

  sl.registerLazySingleton(() => UniversesUseCase(sl()));
}
