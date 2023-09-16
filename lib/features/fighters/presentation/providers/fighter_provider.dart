import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/datasources/fighter_remote_datasource.dart';
import 'package:smash_fighters_reloaded/features/fighters/data/repositories/fighter_repository_impl.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter_params.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/usecases/fighters_usecase.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';

final fighterProvider = FutureProvider.autoDispose((ref) async {
  final String universe = ref.read(currentFilteredUniverse);
  var params = FighterParams(universe: universe);
  var remoteDataSource = FighterRemoteDataSourceImpl();
  var repository = FighterRepositoryImpl(remoteDataSource);
  var usecase = FightersUseCase(repository: repository);
  final results = await usecase.getFighters(params);

  return results.fold(
    (failure) => {throw Exception(failure)},
    (data) => {data},
  );
});

final getFilteredAndSortedFighters =
    Provider.autoDispose.family((ref, List<Fighter> fighters) {
  final Map filters = ref.watch(getCurrentFilters);
  final double minPrice = filters['price'].start;
  final double maxPrice = filters['price'].end;
  final double currentRate = filters['rate'];
  final SortBy currentSortBy = filters['sortBy'];
  final SortByDir currentSortByDir = filters['sortByDir'];

  switch (currentSortBy.name) {
    case 'name':
      if (currentSortByDir.name == 'asc') {
        fighters.sort(
            (fighter1, fighter2) => fighter1.name.compareTo(fighter2.name));
      } else {
        fighters.sort(
            (fighter2, fighter1) => fighter1.name.compareTo(fighter2.name));
      }
      break;
    case 'downloads':
      if (currentSortByDir.name == 'asc') {
        fighters.sort((fighter1, fighter2) =>
            fighter1.downloadsToDouble.compareTo(fighter2.downloadsToDouble));
      } else {
        fighters.sort((fighter2, fighter1) =>
            fighter1.downloadsToDouble.compareTo(fighter2.downloadsToDouble));
      }
      break;
    case 'rate':
      if (currentSortByDir.name == 'asc') {
        fighters.sort((fighter1, fighter2) =>
            fighter1.rateToDouble.compareTo(fighter2.rateToDouble));
      } else {
        fighters.sort((fighter2, fighter1) =>
            fighter1.rateToDouble.compareTo(fighter2.rateToDouble));
      }
      break;
  }

  return fighters.where((fighter) {
    double price = double.tryParse(fighter.price) ?? 0;
    return price >= minPrice && price <= maxPrice;
  }).where((fighter) {
    int rate = int.tryParse(fighter.rate.toString()) ?? 0;
    return rate >= currentRate;
  }).toList();
});
