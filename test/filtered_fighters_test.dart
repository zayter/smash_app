import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/providers/fighter_provider.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/widgets/fighter_grid.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';

void main() {
  testWidgets('Fighter should filtered by current Filters',
      (WidgetTester tester) async {
    var fighters = [
      Fighter(
        objectID: '1',
        name: 'Mario',
        description: 'Mario',
        rate: '5',
        price: '400',
        downloads: '50',
        imageURL: 'www.example.com',
        universe: 'mario',
      ),
      Fighter(
        objectID: '2',
        name: 'Luigi',
        description: 'Luigi',
        rate: '5',
        price: '1000',
        downloads: '50',
        imageURL: 'www.example.com',
        universe: 'mario',
      )
    ];

    final mockedFiltersProvider =
        StateNotifierProvider<FiltersNotifier, Map<dynamic, dynamic>>(
            (ref) => FiltersNotifier());

    var mockedProvider = FutureProvider.autoDispose((ref) {
      return ({fighters});
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fighterProvider.overrideWithProvider(mockedProvider),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  FighterGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Luigi'), findsNothing);
    expect(find.text('Mario'), findsOneWidget);
  });
}
