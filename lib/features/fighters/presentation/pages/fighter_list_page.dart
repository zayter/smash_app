import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/core/themes/app_theme.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/widgets/fighter_grid.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/widgets/drawer_filter.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/widgets/tab.menu.dart';

@RoutePage()
class FighterListPage extends ConsumerWidget {
  const FighterListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final universes = ref.watch(universeProvider);
    final Map currentFilters = ref.watch(getCurrentFilters);

    return universes.when(
      skipLoadingOnRefresh: false,
      loading: () => Container(
        color: kColorScheme.background,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => Text('Error: $err'),
      data: (universes) {
        final List<Universe> sortedUniverses = ref.read(getSortedUniverses);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Fighters'),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: mapEquals(currentFilters, defaultFilters)
                          ? kColorScheme.secondary
                          : kColorScheme.primary,
                    ),
                    icon: const Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ],
          ),
          endDrawer: const DrawerFilter(),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TabMenu(
                    universes: sortedUniverses,
                  ),
                  const Expanded(
                    child: FighterGrid(),
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
