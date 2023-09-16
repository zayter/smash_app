import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/widgets/price_filter.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/widgets/rating_filter.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/widgets/sort_by_dir_filter.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/widgets/sort_by_filter.dart';

class DrawerFilter extends ConsumerWidget {
  const DrawerFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map currentFilters = ref.watch(getCurrentFilters);

    SortBy? sortedByValue = currentFilters['sortBy'];
    RangeValues? priceFilterValue = currentFilters['price'];
    SortByDir? sortedByDirValue = currentFilters['sortByDir'];
    double? rateFilterValue = currentFilters['rate'];

    return Drawer(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  child: DrawerHeader(
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Close',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Filters",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Sort By',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SortByFilter(onChanged: (SortBy? value) {
                  sortedByValue = value;
                }),
                const Divider(),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Sort Direction',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SortByDirFilter(onChanged: (SortByDir? value) {
                  sortedByDirValue = value;
                }),
                const Divider(),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Price',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                PriceFilter(onChanged: (RangeValues values) {
                  priceFilterValue = values;
                }),
                const Divider(),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Stars',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                RatingFilter(onChanged: (double value) {
                  rateFilterValue = value;
                }),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(getCurrentFilters.notifier).setFilters({
                        'price': priceFilterValue,
                        'rate': rateFilterValue,
                        'sortBy': sortedByValue,
                        'sortByDir': sortedByDirValue,
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply Filters'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
