import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/core/api/api.dart';

import 'package:smash_fighters_reloaded/features/fighters/data/models/fighter_model.dart';

import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter_params.dart';

abstract class FighterRemoteDataSource {
  Future<List<FighterModel>> getFighters(FighterParams params);
}

class FighterRemoteDataSourceImpl implements FighterRemoteDataSource {
  final Api _api = GetIt.I.get<Api>();

  FighterRemoteDataSourceImpl();

  @override
  Future<List<FighterModel>> getFighters(FighterParams params) async {
    try {
      var result = await _api.getFighters(params.universe);
      return result.data;
    } on DioException catch (dioError) {
      throw ServerFailure(message: "${dioError.message}");
    }
  }
}
