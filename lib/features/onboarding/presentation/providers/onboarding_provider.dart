import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getOnboardingPref = FutureProvider.autoDispose((ref) async {
  var sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('onboardingFinished') ?? false;
});
