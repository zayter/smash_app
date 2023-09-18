import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';

class RatingFilter extends ConsumerStatefulWidget {
  const RatingFilter({super.key, required this.onChanged});

  final void Function(double value) onChanged;

  @override
  ConsumerState<RatingFilter> createState() => _RatingFilterState();
}

class _RatingFilterState extends ConsumerState<RatingFilter> {
  late final double _currentRateValue = ref.watch(filterProvider)['rate'];

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: _currentRateValue,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 20,
      itemPadding: const EdgeInsets.all(8),
      ratingWidget: RatingWidget(
        full: Image.asset('assets/images/full_star_yellow.png'),
        half: Image.asset('assets/images/empty_star.png'),
        empty: Image.asset('assets/images/empty_star.png'),
      ),
      onRatingUpdate: (rating) {
        widget.onChanged(rating);
      },
    );
  }
}
