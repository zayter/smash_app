import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/repositories/universe_repository.dart';

class UniversesUseCase implements UniverseRepository {
  final UniverseRepository repository;

  UniversesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Universe>>> getUniverses() async {
    return await repository.getUniverses();
  }
}
