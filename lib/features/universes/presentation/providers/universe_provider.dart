import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:get_it/get_it.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/usecases/universes_usecase.dart';

final universeProvider = FutureProvider.autoDispose((ref) async {
  var usecase = GetIt.I.get<UniversesUseCase>();
  final results = await usecase.getUniverses();

  return results.fold(
    (failure) => {throw Exception(failure)},
    (data) => {data},
  );
});

final Provider<List<Universe>> getSortedUniverses = Provider((ref) {
  final List<Universe> sortedUniverses =
      ref.read(universeProvider).value!.first;

  sortedUniverses.sort((universe1, universe2) {
    var sorted = universe1.name.compareTo(universe2.name);
    if (sorted != 0) return sorted;
    return universe1.name.compareTo(universe2.name);
  });

  sortedUniverses.insert(
      0, Universe(objectID: 'all', name: 'All', description: 'All Universes'));
  return sortedUniverses;
});

class UniverseFilterNotifier extends StateNotifier<String> {
  UniverseFilterNotifier() : super('');

  String updateSelectedUniverse(String universe) {
    state = universe;
    return state;
  }
}

final currentFilteredUniverse =
    StateNotifierProvider<UniverseFilterNotifier, String>((ref) {
  return UniverseFilterNotifier();
});
