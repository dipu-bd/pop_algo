// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';
import './lower_bound.dart';

/// Returns the index of the _first_ occurance of the [value] in a sorted [list],
/// otherwise -1 if not found. It is ensured that the index is as lowest as possible.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * The [value] must be comparable with the list items. Otherwise, [TypeError] is thrown.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, [RangeError] is thrown.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// Internally it calls the [lowerBound] method, passing true to the `exactMatch` parameter.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearch<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  return lowerBound<E, V>(
    list,
    value,
    start: start,
    count: count,
    compare: compare,
    exactMatch: true,
  );
}
