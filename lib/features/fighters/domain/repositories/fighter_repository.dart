import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter_params.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';

abstract class FighterRepository {
  Future<Either<Failure, List<Fighter>>> getFighters(FighterParams params);
}
