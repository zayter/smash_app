import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';

abstract class UniverseRepository {
  Future<Either<Failure, List<Universe>>> getUniverses();
}
