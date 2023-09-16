import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/datasources/fighter_remote_datasource.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter_params.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/repositories/fighter_repository.dart';

class FighterRepositoryImpl implements FighterRepository {
  final FighterRemoteDataSource _remoteDataSource;

  FighterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Fighter>>> getFighters(
      FighterParams params) async {
    try {
      final result = await _remoteDataSource.getFighters(params).then(
          (fighters) => fighters.map((fighter) => fighter.toFighter).toList());
      return Right(result);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }
}
