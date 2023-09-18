import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';

class PriceFilter extends ConsumerStatefulWidget {
  const PriceFilter({super.key, required this.onChanged});

  final void Function(RangeValues values) onChanged;

  @override
  ConsumerState<PriceFilter> createState() => _RangeSliderPriceState();
}

class _RangeSliderPriceState extends ConsumerState<PriceFilter> {
  late RangeValues _currentRangeValues = ref.watch(filterProvider)['price'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${_currentRangeValues.start.round().toString()}'),
              Text('\$${_currentRangeValues.end.round().toString()}'),
            ],
          ),
        ),
        RangeSlider(
          values: _currentRangeValues,
          max: defaultFilters['price'].end,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              widget.onChanged(values);
            });
          },
        ),
      ],
    );
  }
}
