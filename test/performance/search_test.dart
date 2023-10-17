import 'package:flutter_test/flutter_test.dart';
import 'package:pangolin/services/search_service.dart';

void main() {
  group("Checking performance of Anagram Search", () {
    test("Check for Unique Anagram: ARIOTEE (ETAERIO).", () async {
      final startTime = DateTime.now(); // Record the start time
      final result = await searchForAnagrams("ARIOTEE", "CSW21");
      final endTime = DateTime.now(); // Record the end time

      // Calculate the duration.
      final duration = endTime.difference(startTime);

      print('Test took ${duration.inMilliseconds} ms to finish.');

      expect(result, ["ETAERIO"]);
    });
  });
  group("Checking performance of Pattern Search", () {
    test("Check for Unique Pattern: ARIOTEE (ETAERIO).", () async {
      final startTime = DateTime.now(); // Record the start time
      final result = await searchForPatterns("ETAERIO", "CSW21");
      final endTime = DateTime.now(); // Record the end time

      // Calculate the duration.
      final duration = endTime.difference(startTime);

      print('Test took ${duration.inMilliseconds} ms to finish.');

      expect(result, ["ETAERIO"]);
    });
    test("Check for Patterns with 1 blank: ARIOTEE (ETAERIO).", () async {
      final startTime = DateTime.now(); // Record the start time
      final result = await searchForPatterns("F?P", "CSW21");
      final endTime = DateTime.now(); // Record the end time

      // Calculate the duration.
      final duration = endTime.difference(startTime);

      print('Test took ${duration.inMilliseconds} ms to finish.');

      expect(result, ["FAP", "FOP"]);
    });
    test("Check for Patterns with 2 blanks: W?i?r (WHIRR and WRIER).",
        () async {
      final startTime = DateTime.now(); // Record the start time
      final result = await searchForPatterns("W?I?R", "CSW21");
      final endTime = DateTime.now(); // Record the end time

      // Calculate the duration.
      final duration = endTime.difference(startTime);

      print('Test took ${duration.inMilliseconds} ms to finish.');

      expect(result, ["WHIRR", "WRIER"]);
    });
    test("Check for Patterns with 3 blanks: PY?IL?? (WHIRR and WRIER).",
        () async {
      final startTime = DateTime.now(); // Record the start time
      final result = await searchForPatterns("PY?IL??", "CSW21");
      final endTime = DateTime.now(); // Record the end time

      // Calculate the duration.
      final duration = endTime.difference(startTime);

      print('Test took ${duration.inMilliseconds} ms to finish.');

      expect(result, []);
    });
  });
}
