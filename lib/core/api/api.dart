import 'package:smash_fighters_reloaded/core/api/services/universe_service.dart';
import 'package:smash_fighters_reloaded/core/environment.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/models/fighter_model.dart';
import 'package:smash_fighters_reloaded/core/api/services/fighter_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smash_fighters_reloaded/features/universes/data/models/universe_model.dart';
part 'api.g.dart';

@RestApi(baseUrl: Environment.baseUrl)
abstract class Api with FighterService, UniverseService {
  factory Api() {
    final dio = Dio();
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 150,
      )
    ]);

    dio.options = BaseOptions(
      headers: {
        'content-type': 'application/json',
      },
    );

    return _Api(dio);
  }
}
