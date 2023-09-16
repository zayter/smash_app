import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:smash_fighters_reloaded/core/api/failure.dart';
import 'package:smash_fighters_reloaded/core/api/api.dart';
import 'package:smash_fighters_reloaded/features/universes/data/models/universe_model.dart';

abstract class UniverseRemoteDataSource {
  Future<List<UniverseModel>> getUniverses();
}

class UniverseRemoteDataSourceImpl implements UniverseRemoteDataSource {
  final Api _api = GetIt.I.get<Api>();

  UniverseRemoteDataSourceImpl();

  @override
  Future<List<UniverseModel>> getUniverses() async {
    try {
      var result = await _api.getUniverses();
      return result.data;
    } on DioException catch (dioError) {
      throw ServerFailure(message: "${dioError.message}");
    }
  }
}
