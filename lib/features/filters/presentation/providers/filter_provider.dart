import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';

class FiltersNotifier extends StateNotifier<Map<dynamic, dynamic>> {
  FiltersNotifier() : super(defaultFilters);

  void setFilters(Map<String, dynamic> chosenFilters) {
    state = chosenFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<dynamic, dynamic>>(
  (ref) => FiltersNotifier(),
);
