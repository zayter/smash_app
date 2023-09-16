import 'package:retrofit/retrofit.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/models/fighter_model.dart';

mixin FighterService {
  @GET('/fighters')
  Future<HttpResponse<List<FighterModel>>> getFighters(
      @Query('universe') String universe);
}
