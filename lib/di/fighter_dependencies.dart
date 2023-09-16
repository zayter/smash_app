import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/datasources/fighter_remote_datasource.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/repositories/fighter_repository_impl.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/repositories/fighter_repository.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/usecases/fighters_usecase.dart';

void fighterDependencies(GetIt sl) {
  sl.registerLazySingleton<FighterRemoteDataSource>(
      () => FighterRemoteDataSourceImpl());

  sl.registerLazySingleton<FighterRepository>(
      () => FighterRepositoryImpl(sl()));

  sl.registerLazySingleton(() => FightersUseCase(repository: sl()));
}
