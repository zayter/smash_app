import 'package:flutter/material.dart';

enum SortBy { name, rate, downloads }

enum SortByDir { asc, desc }

final dynamic defaultFilters = {
  'price': const RangeValues(0.0, 999.0),
  'rate': 1.0,
  'sortBy': SortBy.name,
  'sortByDir': SortByDir.asc
};
