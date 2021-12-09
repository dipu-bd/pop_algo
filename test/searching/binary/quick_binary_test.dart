// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';
import 'package:trotter/trotter.dart';

void main() {
  group('quickBinarySearch()', () {
    group('Check if type errors are thrown', () {
      test("Case: int vs. string", () {
        expect(() => quickBinarySearch([1], '1'),
            throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. int", () {
        expect(() => quickBinarySearch(['1'], 1),
            throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. double", () {
        expect(() => quickBinarySearch(['1'], 1.0),
            throwsA(TypeMatcher<TypeError>()));
      });
    });

    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(quickBinarySearch(arr, i - 5.5), i);
      }
    });

    group('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      test("Case: 0 to 9", () {
        for (int i = 0; i < 10; ++i) {
          expect(quickBinarySearch(arr, i), i);
        }
      });
      test("Case -20", () {
        expect(quickBinarySearch(arr, -20), -1);
      });
      test("Case 20", () {
        expect(quickBinarySearch(arr, 20), -1);
      });
      test("Case 10", () {
        expect(quickBinarySearch(arr, 10), -1);
      });
      test("Case -1", () {
        expect(quickBinarySearch(arr, -1), -1);
      });
      test("Case -10", () {
        expect(quickBinarySearch(arr, -10), -1);
      });
      test("Case 5.0 + 1e-10", () {
        expect(quickBinarySearch(arr, 5.0 + 1e-10), -1);
      });
      test("Case 0.0", () {
        expect(quickBinarySearch(arr, 0.0), 0);
      });
      test("Case 5.0 + 1e-30", () {
        expect(quickBinarySearch(arr, 5.0 + 1e-30), 5);
      });
      test("Case 5.0", () {
        expect(quickBinarySearch(arr, 5.0), 5);
      });
    });

    group('Find items from a string array', () {
      var arr = characters('abcdefghijk');
      test("Case: 'a'", () {
        expect(quickBinarySearch(arr, 'a'), 0);
      });
      test("Case: 'd'", () {
        expect(quickBinarySearch(arr, 'd'), 3);
      });
      test("Case: 'k'", () {
        expect(quickBinarySearch(arr, 'k'), arr.length - 1);
      });
    });
    group('Find items from an empty array', () {
      test("Case: 2", () {
        expect(quickBinarySearch(<int>[], 2), -1);
      });
      test("Case: 2.0", () {
        expect(quickBinarySearch(<double>[], 2.0), -1);
      });
      test("Case: '1.0'", () {
        expect(quickBinarySearch(<String>[], '1.0'), -1);
      });
    });

    group('Test using start and count', () {
      var arr = [-3, -2, 0, 2, 3, 10];

      test("Case: find -2, start: -10", () {
        expect(quickBinarySearch(arr, -2, start: -10), 1);
      });
      test("Case: find -2, start: 1", () {
        expect(quickBinarySearch(arr, -2, start: 1), 1);
      });
      test("Case: find -2, start: 2", () {
        expect(quickBinarySearch(arr, -2, start: 2), -1);
      });
      test("Case: find 10, start: 5", () {
        expect(quickBinarySearch(arr, 10, start: 5), 5);
      });
      test("Case: find 10, start: 6", () {
        expect(quickBinarySearch(arr, 10, start: 6), -1);
      });
      test("Case: find 3, start: 5", () {
        expect(quickBinarySearch(arr, 3, start: 5), -1);
      });

      test("Case: find 2, count: -10", () {
        expect(quickBinarySearch(arr, 2, count: -10), -1);
      });
      test("Case: find 2, count: 0", () {
        expect(quickBinarySearch(arr, 2, count: 0), -1);
      });
      test("Case: find 2, count: 1", () {
        expect(quickBinarySearch(arr, 2, count: 1), -1);
      });
      test("Case: find 2, count: 3", () {
        expect(quickBinarySearch(arr, 2, count: 3), -1);
      });
      test("Case: find 2, count: 4", () {
        expect(quickBinarySearch(arr, 2, count: 4), 3);
      });
      test("Case: find 2, count: 50", () {
        expect(quickBinarySearch(arr, 2, count: 50), 3);
      });
      test("Case: find 2, count: 50", () {
        expect(quickBinarySearch(arr, 2, count: 50), 3);
      });

      test("Case: find 2, start: -10, count: -1", () {
        expect(quickBinarySearch(arr, 2, start: -10, count: -1), -1);
      });
      test("Case: find 2, start: -10, count: 1", () {
        expect(quickBinarySearch(arr, 2, start: -10, count: 1), -1);
      });
      test("Case: find 2, start: -10, count: 13", () {
        expect(quickBinarySearch(arr, 2, start: -10, count: 13), -1);
      });
      test("Case: find 2, start: -10, count: 14", () {
        expect(quickBinarySearch(arr, 2, start: -10, count: 14), 3);
      });
      test("Case: find 2, start: -10, count: 100", () {
        expect(quickBinarySearch(arr, 2, start: -10, count: 100), 3);
      });

      test("Case: find 2, start: 2, count: -1", () {
        expect(quickBinarySearch(arr, 2, start: 2, count: -1), -1);
      });
      test("Case: find 2, start: 2, count: 1", () {
        expect(quickBinarySearch(arr, 2, start: 2, count: 1), -1);
      });
      test("Case: find 2, start: 2, count: 2", () {
        expect(quickBinarySearch(arr, 2, start: 2, count: 2), 3);
      });
      test("Case: find 2, start: 2, count: 100", () {
        expect(quickBinarySearch(arr, 2, start: 2, count: 100), 3);
      });

      test("Case: find 2, start: 3, count: 0", () {
        expect(quickBinarySearch(arr, 2, start: 3, count: 0), -1);
      });
      test("Case: find 2, start: 3, count: 1", () {
        expect(quickBinarySearch(arr, 2, start: 3, count: 1), 3);
      });
      test("Case: find 2, start: 4, count: -10", () {
        expect(quickBinarySearch(arr, 2, start: 4, count: -10), -1);
      });
      test("Case: find 2, start: 4, count: -1", () {
        expect(quickBinarySearch(arr, 2, start: 4, count: -1), -1);
      });
      test("Case: find 2, start: 4, count: 10", () {
        expect(quickBinarySearch(arr, 2, start: 4, count: 10), -1);
      });
    });
  });

  group('quickBinarySearch() with custom [compare]', () {
    final comp = ((num a, num b) => (a - b).toInt());
    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(quickBinarySearch(arr, i - 5.5, compare: comp), i);
      }
    });

    group('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      test("Case: 0 to 9", () {
        for (int i = 0; i < 10; ++i) {
          expect(quickBinarySearch(arr, i, compare: comp), i);
        }
      });
      test("Case -20", () {
        expect(quickBinarySearch(arr, -20, compare: comp), -1);
      });
      test("Case 20", () {
        expect(quickBinarySearch(arr, 20, compare: comp), -1);
      });
      test("Case 10", () {
        expect(quickBinarySearch(arr, 10, compare: comp), -1);
      });
      test("Case -1", () {
        expect(quickBinarySearch(arr, -1, compare: comp), -1);
      });
      test("Case -10", () {
        expect(quickBinarySearch(arr, -10, compare: comp), -1);
      });
      test("Case 0.0", () {
        expect(quickBinarySearch(arr, 0.0, compare: comp), 0);
      });
      test("Case 5.0 + 1e-30", () {
        expect(quickBinarySearch(arr, 5.0 + 1e-30, compare: comp), 5);
      });
      test("Case 5.0", () {
        expect(quickBinarySearch(arr, 5.0, compare: comp), 5);
      });
    });

    group('Test using start and count', () {
      var arr = [-3, -2, 0, 2, 3, 10];

      test("Case: find -2, start: -10", () {
        expect(quickBinarySearch(arr, -2, compare: comp, start: -10), 1);
      });
      test("Case: find -2, start: 1", () {
        expect(quickBinarySearch(arr, -2, compare: comp, start: 1), 1);
      });
      test("Case: find -2, start: 2", () {
        expect(quickBinarySearch(arr, -2, compare: comp, start: 2), -1);
      });
      test("Case: find 10, start: 5", () {
        expect(quickBinarySearch(arr, 10, compare: comp, start: 5), 5);
      });
      test("Case: find 10, start: 6", () {
        expect(quickBinarySearch(arr, 10, compare: comp, start: 6), -1);
      });
      test("Case: find 3, start: 5", () {
        expect(quickBinarySearch(arr, 3, compare: comp, start: 5), -1);
      });

      test("Case: find 2, count: -10", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: -10), -1);
      });
      test("Case: find 2, count: 0", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 0), -1);
      });
      test("Case: find 2, count: 1", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 1), -1);
      });
      test("Case: find 2, count: 3", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 3), -1);
      });
      test("Case: find 2, count: 4", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 4), 3);
      });
      test("Case: find 2, count: 50", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 50), 3);
      });
      test("Case: find 2, count: 50", () {
        expect(quickBinarySearch(arr, 2, compare: comp, count: 50), 3);
      });

      test("Case: find 2, start: -10, count: -1", () {
        expect(quickBinarySearch(arr, 2, compare: comp, start: -10, count: -1),
            -1);
      });
      test("Case: find 2, start: -10, count: 1", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: -10, count: 1), -1);
      });
      test("Case: find 2, start: -10, count: 13", () {
        expect(quickBinarySearch(arr, 2, compare: comp, start: -10, count: 13),
            -1);
      });
      test("Case: find 2, start: -10, count: 14", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: -10, count: 14), 3);
      });
      test("Case: find 2, start: -10, count: 100", () {
        expect(quickBinarySearch(arr, 2, compare: comp, start: -10, count: 100),
            3);
      });

      test("Case: find 2, start: 2, count: -1", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 2, count: -1), -1);
      });
      test("Case: find 2, start: 2, count: 1", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 2, count: 1), -1);
      });
      test("Case: find 2, start: 2, count: 2", () {
        expect(quickBinarySearch(arr, 2, compare: comp, start: 2, count: 2), 3);
      });
      test("Case: find 2, start: 2, count: 100", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 2, count: 100), 3);
      });

      test("Case: find 2, start: 3, count: 0", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 3, count: 0), -1);
      });
      test("Case: find 2, start: 3, count: 1", () {
        expect(quickBinarySearch(arr, 2, compare: comp, start: 3, count: 1), 3);
      });
      test("Case: find 2, start: 4, count: -10", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 4, count: -10), -1);
      });
      test("Case: find 2, start: 4, count: -1", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 4, count: -1), -1);
      });
      test("Case: find 2, start: 4, count: 10", () {
        expect(
            quickBinarySearch(arr, 2, compare: comp, start: 4, count: 10), -1);
      });
    });
  });
}
