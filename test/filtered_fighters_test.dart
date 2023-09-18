import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/pages/fighter_list_page.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/providers/fighter_provider.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';

void main() {
  testWidgets('Fighter should filtered by current Filters',
      (WidgetTester tester) async {
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

    var mockedProvider = FutureProvider.autoDispose((ref) {
      return ({fighters});
    });

    var mockedUniverse = FutureProvider.autoDispose((ref) {
      return ({universes});
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fighterProvider.overrideWithProvider(mockedProvider),
          universeProvider.overrideWithProvider(mockedUniverse)
        ],
        child: const MaterialApp(
          title: 'Smash App',
          debugShowCheckedModeBanner: false,
          home: FighterListPage(),
        ),
      ),
    );

    expect(find.text('Fighters(1)'), findsOneWidget);
  });
}
