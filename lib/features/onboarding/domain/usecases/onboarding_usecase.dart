import 'package:smash_fighters_reloaded/features/preferences/domain/entities/preference_params.dart';
import 'package:smash_fighters_reloaded/features/preferences/domain/repositories/preference_repository.dart';

class OnboardingUseCase {
  final PreferenceRepository repository;
  static const String key = 'onboardingFinished';

  OnboardingUseCase(this.repository);

  Future<bool> isOnboarded() async {
    return await repository.fetchPreference(key);
  }

  void setOnboarded() async {
    repository.setPreference(PreferenceParams(key, true));
  }
}
