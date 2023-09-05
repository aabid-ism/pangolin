import 'package:flutter_test/flutter_test.dart';
import 'package:scrabbly/services/search_service.dart';

void main() {
  group("Anagram Search Functionality Check", () {
    test("Check for Unique Anagram: ARIOTEE (ETAERIO).", () async {
      expect(await searchForAnagrams("ARIOTEE", "CSW21"), ["ETAERIO"]);
    });

    test("Check for Non-Unique Anagrams", () async {
      expect(
          await searchForAnagrams("AEIORTN", "CSW21"), ["NOTAIRE", "OTARINE"]);
    });

    test("Check for Sorted Output", () async {
      expect(await searchForAnagrams("ARINEST", "CSW21"), [
        "ANESTRI",
        "ANTSIER",
        "NASTIER",
        "RATINES",
        "RESIANT",
        "RETAINS",
        "RETINAS",
        "RETSINA",
        "STAINER",
        "STARNIE",
        "STEARIN"
      ]);
    });
    test("Check for Different Lengths", () async {
      expect(await searchForAnagrams("WPA", "CSW21"), ["PAW", "WAP"]);
    });

    test("Check for Case-Sensitivity Handling", () async {
      expect(await searchForAnagrams("euio", "CSW21"), ["EUOI"]);
    });
  });

  group("Testing Anagramming with 1 Blank", () {
    test("Check for ZYZZYV? (ZYZZYVA).", () async {
      expect(await searchForAnagrams("ZYZZYV?", "CSW21"), ["ZYZZYVA"]);
    });
    test("Check for jb? (JAB, JIB, JOB).", () async {
      expect(await searchForAnagrams("jb?", "CSW21"), ["JAB", "JIB", "JOB"]);
    });
    test("Check for WQ?? (WAQF).", () async {
      expect(await searchForAnagrams("WQ??", "CSW21"), ["WAQF"]);
    });
    test("Check for WZOI?? (HOWZIT, WHIZZO).", () async {
      expect(await searchForAnagrams("WZOI??", "CSW21"), ["HOWZIT", "WHIZZO"]);
    });
  });

  group("Testing for special characters in input", () {
    test("Using . for blanks", () async {
      expect(await searchForAnagrams("WZOI..", "CSW21"), ["HOWZIT", "WHIZZO"]);
    });
  });

  group("Testing Pattern Search", () {
    test("Test AZ?", () async {
      expect(await searchForPatterns("AZ?", "CSW21"), ["AZO"]);
    });

    test("Test AZO", () async {
      expect(await searchForPatterns("AZO", "CSW21"), ["AZO"]);
    });

    test("Test Q?T", () async {
      expect(await searchForPatterns("Q?T", "CSW21"), ["QAT"]);
    });
    test("Test F?P", () async {
      expect(await searchForPatterns("F?P", "CSW21"), ["FAP", "FOP"]);
    });
  });

  group("Testing Probability Search", () {
    test("Test top 2 7  letters", () async {
      expect(
          await searchForProbability(7, 1, 2, "CSW21"), ["NOTAIRE", "OTARINE"]);
    });

    test("Test top 0 7  letters", () async {
      expect(await searchForProbability(7, 0, 0, "CSW21"), []);
    });
  });

  group("Testing Includes", () {
    test("Test includes Q for 2 letters", () async {
      expect(await searchForIncludes(2, ["Q"], "CSW21"), ["QI"]);
    });

    test("Test includes Z for 2 letters", () async {
      expect(await searchForIncludes(2, ["Z"], "CSW21"), ["ZA", "ZE", "ZO"]);
    });

    test("Test includes ZP for 3 letters", () async {
      expect(await searchForIncludes(3, ["Z", "K"], "CSW21"), ["ZEK"]);
    });

    test("Test includes ZW for 3 letters", () async {
      expect(await searchForIncludes(3, ["Z", "W"], "CSW21"),
          ["WAZ", "WIZ", "WUZ"]);
    });

    // test("Test includes AA for 2 letters", () async {
    //   expect(await searchForIncludes(2, ["A", "A"], "CSW21"), ["AA"]);
    // });
  });
}
