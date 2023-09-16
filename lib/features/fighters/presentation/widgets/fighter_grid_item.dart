import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smash_fighters_reloaded/core/routes/app_router.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';

class FighterGridItem extends StatelessWidget {
  const FighterGridItem({
    super.key,
    required this.fighter,
  });

  final Fighter fighter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context)
            .push(FighterDetailRoute(id: fighter.objectID, fighter: fighter));
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/zelda.png',
                  height: 140,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Text(fighter.name,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  )),
          Text(fighter.universe, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
