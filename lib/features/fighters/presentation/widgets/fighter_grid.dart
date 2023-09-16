import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/providers/fighter_provider.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/widgets/fighter_grid_item.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';

class FighterGrid extends ConsumerWidget {
  const FighterGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fighters = ref.watch(fighterProvider);
    final Map currentFilters = ref.watch(getCurrentFilters);

    return fighters.when(
      skipLoadingOnRefresh: false,
      loading: () => const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => Text('Error: $err'),
      data: (fighters) {
        final filteredFighters =
            ref.watch(getFilteredAndSortedFighters(fighters.first));

        return Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(currentFilteredUniverse);
              ref.invalidate(universeProvider);
              ref.invalidate(getCurrentFilters);
            },
            child: Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 50,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            mapEquals(currentFilters, defaultFilters)
                                ? 'Fighters(${filteredFighters.length.toString()})'
                                : 'Filtered(${filteredFighters.length.toString()})',
                            style: Theme.of(context).textTheme.titleMedium!,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 50,
                        child: Divider(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                      ),
                      children: [
                        for (final fighter in filteredFighters)
                          Center(
                            child: FighterGridItem(
                              fighter: fighter,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
