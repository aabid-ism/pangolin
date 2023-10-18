import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/utils.dart';

class SpawnTwoLetterReviewList extends StatelessWidget {
  const SpawnTwoLetterReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Power Two\'s',
        'Two letter words with J,Q,Z, and X',
        () {
          return combineWordResults([
            searchForIncludes(2, ["J"], provider.lexicon.lexiconString),
            searchForIncludes(2, ["Q"], provider.lexicon.lexiconString),
            searchForIncludes(2, ["Z"], provider.lexicon.lexiconString),
            searchForIncludes(2, ["X"], provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'Alpha Two\'s',
        'Two letter words starting with A',
        () {
          return searchForPatterns("A?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'B C D',
        'Two letter words starting with B,C and D',
        () {
          return combineWordResults([
            searchForPatterns("B?", provider.lexicon.lexiconString),
            searchForPatterns("C?", provider.lexicon.lexiconString),
            searchForPatterns("D?", provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'Elephant Two\'s',
        'Two letter words starting with E',
        () {
          return searchForPatterns("E?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'F G H',
        'Two letter words starting with F,G and H',
        () {
          return combineWordResults([
            searchForPatterns("F?", provider.lexicon.lexiconString),
            searchForPatterns("G?", provider.lexicon.lexiconString),
            searchForPatterns("H?", provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'Iguana Two\'s',
        'Two letter words starting with I',
        () {
          return searchForPatterns("I?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Koala Two\'s',
        'Two letter words with K',
        () {
          return searchForIncludes(2, ["K"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'L M N',
        'Two letter words starting with L,M and N',
        () {
          return combineWordResults([
            searchForPatterns("L?", provider.lexicon.lexiconString),
            searchForPatterns("M?", provider.lexicon.lexiconString),
            searchForPatterns("N?", provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'P R S T',
        'Two letter words starting with P,R,S and T',
        () {
          return combineWordResults([
            searchForPatterns("P?", provider.lexicon.lexiconString),
            searchForPatterns("R?", provider.lexicon.lexiconString),
            searchForPatterns("S?", provider.lexicon.lexiconString),
            searchForPatterns("T?", provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'Umbrella Two\'s',
        'Two letter words starting with U',
        () {
          return searchForPatterns("U?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'V W Y',
        'Two letter words starting with V,W and Y',
        () {
          return combineWordResults([
            searchForPatterns("V?", provider.lexicon.lexiconString),
            searchForPatterns("W?", provider.lexicon.lexiconString),
            searchForPatterns("Y?", provider.lexicon.lexiconString),
          ]);
        },
      ),
      ReviewTile(
        'All Together',
        'All two letter words',
        () {
          return searchForPatterns("??", provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('2 Letter Review List'),
      ),
      body: ListView.builder(
        itemCount: myReviewTiles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(myReviewTiles[index].title),
              subtitle: Text(myReviewTiles[index].subtitle),
              onTap: () {
                buildShowDialog(context);
                myReviewTiles[index].onPressed(context);
              },
            ),
          );
        },
      ),
    );
  }
}
