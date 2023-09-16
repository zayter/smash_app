import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';

class SortByFilter extends ConsumerStatefulWidget {
  const SortByFilter({super.key, required this.onChanged});

  final void Function(SortBy? value) onChanged;

  @override
  ConsumerState<SortByFilter> createState() => _SortByFilterState();
}

class _SortByFilterState extends ConsumerState<SortByFilter> {
  late SortBy? _currentSortedValue = ref.watch(getCurrentFilters)['sortBy'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20),
      child: Column(
        children: [
          ListTile(
            title: const Text('Name'),
            minVerticalPadding: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            trailing: Radio<SortBy>(
              value: SortBy.name,
              groupValue: _currentSortedValue,
              onChanged: (SortBy? value) {
                setState(() {
                  _currentSortedValue = value;
                });
                widget.onChanged(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Rate'),
            minVerticalPadding: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            trailing: Radio<SortBy>(
              value: SortBy.rate,
              groupValue: _currentSortedValue,
              onChanged: (SortBy? value) {
                setState(() {
                  _currentSortedValue = value;
                });
                widget.onChanged(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Downloads'),
            minVerticalPadding: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            trailing: Radio<SortBy>(
              value: SortBy.downloads,
              groupValue: _currentSortedValue,
              onChanged: (SortBy? value) {
                setState(() {
                  _currentSortedValue = value;
                  widget.onChanged(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
