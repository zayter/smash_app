import 'package:shared_preferences/shared_preferences.dart';
import 'package:smash_fighters_reloaded/features/preferences/data/models/preference_model.dart';
import 'package:smash_fighters_reloaded/features/preferences/domain/entities/preference_params.dart';

abstract class PreferenceLocalDataSource {
  void setPreference(PreferenceParams params);
  Future<PreferenceModel?> fetchPreference(String key);
}

class PreferenceLocalDataSourceImpl implements PreferenceLocalDataSource {
  PreferenceLocalDataSourceImpl();

  @override
  void setPreference(PreferenceParams params) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(params.key, params.value);
  }

  @override
  Future<PreferenceModel?> fetchPreference(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    PreferenceModel preference = PreferenceModel(
      key: key,
      value: pref.getBool(key) ?? false,
    );
    return preference;
  }
}
