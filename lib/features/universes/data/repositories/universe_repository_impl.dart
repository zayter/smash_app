import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/features/universes/data/datasources/universe_remote_datasource.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/repositories/universe_repository.dart';

class UniverseRepositoryImpl implements UniverseRepository {
  final UniverseRemoteDataSource _remoteDataSource;

  UniverseRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Universe>>> getUniverses() async {
    try {
      final result = await _remoteDataSource.getUniverses().then((universes) =>
          universes.map((universe) => universe.toUniverse).toList());
      return Right(result);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }
}
