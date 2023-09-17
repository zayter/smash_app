import 'package:dartz/dartz.dart';
import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter_params.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/repositories/fighter_repository.dart';

class FilmsParams {
  final String path;
  FilmsParams({
    required this.path,
  });
}

class FightersUseCase implements FighterRepository {
  final FighterRepository repository;

  FightersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Fighter>>> getFighters(
      FighterParams params) async {
    return await repository.getFighters(params);
  }
}
