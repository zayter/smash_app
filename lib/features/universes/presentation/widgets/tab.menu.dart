import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/fighters/presentation/providers/fighter_provider.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
import 'package:smash_fighters_reloaded/features/universes/presentation/providers/universe_provider.dart';

class TabMenu extends ConsumerStatefulWidget {
  final List<Universe> universes;

  const TabMenu({super.key, required this.universes});

  @override
  ConsumerState<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends ConsumerState<TabMenu> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle notSelectedStyle = ElevatedButton.styleFrom(
      side: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.universes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: currentIndex == index
                          ? ElevatedButton.styleFrom()
                          : notSelectedStyle,
                      onPressed: () {
                        final String universeQueryID =
                            widget.universes[index].name;
                        ref
                            .read(currentUniverseProvider.notifier)
                            .updateSelectedUniverse(universeQueryID == 'All'
                                ? ''
                                : universeQueryID);
                        ref.invalidate(fighterProvider);
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Center(
                        child: Text(
                          widget.universes[index].name,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
