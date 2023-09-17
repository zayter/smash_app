import 'package:smash_fighters_reloaded/features/preferences/domain/entities/preference_params.dart';

abstract class PreferenceRepository {
  Future<bool> fetchPreference(String key);
  void setPreference(PreferenceParams params);
}
