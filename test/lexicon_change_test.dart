import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scrabbly/enums/lexicon.dart';
import 'package:scrabbly/providers/word_review_provider.dart';

// class MockNewsService extends Mock implements NewsService {}

void main() {
  late WordStateProvider sut;
  setUp(() {
    sut = WordStateProvider();
  });

  group('Lexicon Load Up', () {
    // final articlesFromService = [
    //   Article(title: 'Test 1', content: 'Test 1 content'),
    //   Article(title: 'Test 2', content: 'Test 2 content'),
    //   Article(title: 'Test 3', content: 'Test 3 content'),
    // ];

    // void arrangeInitializeReviewList() {
    //   when(() => sut.initializeReviewList()).thenAnswer(
    //     (_) async => Lexicon.CSW21,
    //   );
    // }

    // test(
    //   "provider initializes variable lexicon to a type of lexicon",
    //   () async {
    //     sut.initializeReviewList();
    //     // ignore: unnecessary_type_check
    //     expect(sut.lexicon is Lexicon, true);
    //   },
    // );

    // test(
    //   """change lexicon to NWL20""",
    //   () {
    //     //Arrange
    //     sut.initializeAppState(Lexicon.CSW21.lexiconString);
    //     // Act
    //     sut.changeLexicon(Lexicon.NWL20);
    //     // Assert
    //     expect(sut.lexicon, Lexicon.NWL20);
    //   },
    // );
  });
}
