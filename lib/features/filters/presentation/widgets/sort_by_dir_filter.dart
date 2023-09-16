import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smash_fighters_reloaded/features/filters/domain/entities/filters.dart';
import 'package:smash_fighters_reloaded/features/filters/presentation/providers/filter_provider.dart';

class SortByDirFilter extends ConsumerStatefulWidget {
  const SortByDirFilter({super.key, required this.onChanged});

  final void Function(SortByDir? value) onChanged;

  @override
  ConsumerState<SortByDirFilter> createState() => _SortByDirFilterState();
}

class _SortByDirFilterState extends ConsumerState<SortByDirFilter> {
  late SortByDir? _currentSortedValue =
      ref.watch(getCurrentFilters)['sortByDir'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20),
      child: Column(
        children: [
          ListTile(
            title: const Text('Ascending'),
            minVerticalPadding: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            trailing: Radio<SortByDir>(
              value: SortByDir.asc,
              groupValue: _currentSortedValue,
              onChanged: (SortByDir? value) {
                setState(() {
                  _currentSortedValue = value;
                  widget.onChanged(value);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Descending'),
            minVerticalPadding: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            trailing: Radio<SortByDir>(
              value: SortByDir.desc,
              groupValue: _currentSortedValue,
              onChanged: (SortByDir? value) {
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
