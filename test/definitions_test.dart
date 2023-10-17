import 'package:flutter_test/flutter_test.dart';
import 'package:pangolin/services/get_definition.dart';
import 'package:pangolin/services/search_service.dart';

void main() {
  group("Check for Definitions", () {
    test("Check for Definition of Paua.", () async {
      expect(await getWordDefinitions("PAUA"), [
        [
          "noun",
          "A large, edible abalone, Haliotis iris, native to New Zealand, whose shell is used to make jewelry."
        ]
      ]);
    });

    test("Check for Definition of Mail.", () async {
      expect(await getWordDefinitions("MaIl"), [
        ['noun', 'A bag or wallet.'],
        [
          'verb',
          '(ditransitive) To send (a letter, parcel, etc.) through the mail.'
        ],
        ['noun', 'Armour consisting of metal rings or plates linked together.'],
        ['verb', 'To arm with mail.'],
        ['noun', 'An old French coin worth half a denier.']
      ]);
    });
  });
}
