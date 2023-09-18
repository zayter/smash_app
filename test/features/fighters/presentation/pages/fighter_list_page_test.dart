import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/pages/fighter_list_page.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/providers/fighter_provider.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/widgets/fighter_grid_item.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';
import 'package:mockito/mockito.dart';

class FiltersNotifierMock extends StateNotifier<Map<dynamic, dynamic>>
    with Mock
    implements FiltersNotifier {
  FiltersNotifierMock(defaultFilters) : super(defaultFilters);
}

void main() {
  group(
    'Fighter Filters Tests',
    () {
      late AutoDisposeFutureProvider<Set<List<Fighter>>> mockedFighterProvider;
      late AutoDisposeFutureProvider<Set<List<Universe>>>
          mockedUniverseProvider;
      late StateNotifierProvider<FiltersNotifierMock, Map> mockedFilterProvider;

      setUp(() {
        var universes = [
          Universe(
            objectID: '1',
            name: 'Mario',
            description: 'Mario',
          ),
        ];

        var fighters = [
          Fighter(
            objectID: '1',
            name: 'Mario',
            description: 'Mario',
            rate: '1',
            price: '399',
            downloads: '50',
            imageURL: 'www.example.com',
            universe: 'mario',
          ),
          Fighter(
            objectID: '2',
            name: 'Luigi',
            description: 'Luigi',
            rate: '2',
            price: '400',
            downloads: '50',
            imageURL: 'www.example.com',
            universe: 'mario',
          ),
          Fighter(
            objectID: '2',
            name: 'Peach',
            description: 'Peach',
            rate: '3',
            price: '250',
            downloads: '50',
            imageURL: 'www.example.com',
            universe: 'mario',
          ),
          Fighter(
            objectID: '2',
            name: 'Bowser',
            description: 'Bowser',
            rate: '4',
            price: '100',
            downloads: '50',
            imageURL: 'www.example.com',
            universe: 'mario',
          )
        ];

        mockedFighterProvider = FutureProvider.autoDispose((ref) {
          return ({fighters});
        });

        mockedUniverseProvider = FutureProvider.autoDispose((ref) {
          return ({universes});
        });
      });

      testWidgets(
        'Fighters should be filtered by price',
        (WidgetTester tester) async {
          dynamic filters = {
            'price': const RangeValues(100.0, 399.0),
            'rate': 1.0,
            'sortBy': SortBy.name,
            'sortByDir': SortByDir.asc
          };

          mockedFilterProvider =
              StateNotifierProvider<FiltersNotifierMock, Map<dynamic, dynamic>>(
            (ref) => FiltersNotifierMock(filters),
          );

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                fighterProvider.overrideWithProvider(mockedFighterProvider),
                universeProvider.overrideWithProvider(mockedUniverseProvider),
                filterProvider.overrideWithProvider(mockedFilterProvider),
              ],
              child: const MaterialApp(
                title: 'Smash App',
                debugShowCheckedModeBanner: false,
                home: FighterListPage(),
              ),
            ),
          );

          expect(find.text('Filtered(3)'), findsOneWidget);
          expect(find.byType(FighterGridItem), findsNWidgets(3));
        },
      );

      testWidgets(
        'Fighters should be filtered by rate',
        (WidgetTester tester) async {
          dynamic filters = {
            'price': const RangeValues(0, 999.0),
            'rate': 3.0,
            'sortBy': SortBy.name,
            'sortByDir': SortByDir.asc
          };

          mockedFilterProvider =
              StateNotifierProvider<FiltersNotifierMock, Map<dynamic, dynamic>>(
            (ref) => FiltersNotifierMock(filters),
          );

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                fighterProvider.overrideWithProvider(mockedFighterProvider),
                universeProvider.overrideWithProvider(mockedUniverseProvider),
                filterProvider.overrideWithProvider(mockedFilterProvider),
              ],
              child: const MaterialApp(
                title: 'Smash App',
                debugShowCheckedModeBanner: false,
                home: FighterListPage(),
              ),
            ),
          );

          expect(find.text('Filtered(2)'), findsOneWidget);
          expect(find.byType(FighterGridItem), findsNWidgets(2));
        },
      );

      testWidgets(
        'Fighters should be filtered by a combination of price and rate',
        (WidgetTester tester) async {
          dynamic filters = {
            'price': const RangeValues(399, 400.0),
            'rate': 2.0,
            'sortBy': SortBy.name,
            'sortByDir': SortByDir.asc
          };

          mockedFilterProvider =
              StateNotifierProvider<FiltersNotifierMock, Map<dynamic, dynamic>>(
            (ref) => FiltersNotifierMock(filters),
          );

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                fighterProvider.overrideWithProvider(mockedFighterProvider),
                universeProvider.overrideWithProvider(mockedUniverseProvider),
                filterProvider.overrideWithProvider(mockedFilterProvider),
              ],
              child: const MaterialApp(
                title: 'Smash App',
                debugShowCheckedModeBanner: false,
                home: FighterListPage(),
              ),
            ),
          );

          expect(find.text('Filtered(1)'), findsOneWidget);
          expect(find.byType(FighterGridItem), findsNWidgets(1));
        },
      );
    },
  );
}
