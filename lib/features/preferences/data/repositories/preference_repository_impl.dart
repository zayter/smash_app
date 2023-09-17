import 'package:smash_fighters_reloaded/features/preferences/data/datasources/preference_local_datasource.dart';
import 'package:smash_fighters_reloaded/features/preferences/domain/entities/preference_params.dart';
import 'package:smash_fighters_reloaded/features/preferences/domain/repositories/preference_repository.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  final PreferenceLocalDataSource _localDataSource;

  PreferenceRepositoryImpl(this._localDataSource);

  @override
  Future<bool> fetchPreference(String key) async {
    return _localDataSource.fetchPreference(key).then((pref) => pref?.value);
  }

  @override
  void setPreference(PreferenceParams params) async {
    _localDataSource.setPreference(params);
  }
}
