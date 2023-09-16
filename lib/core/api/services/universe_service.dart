import 'package:retrofit/retrofit.dart';
import 'package:smash_fighters_reloaded/features/universes/data/models/universe_model.dart';

mixin UniverseService {
  @GET('/universes')
  Future<HttpResponse<List<UniverseModel>>> getUniverses();
}
