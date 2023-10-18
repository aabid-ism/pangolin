import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/review_list/2_letter_list.dart';
import 'package:pangolin/widgets/utils.dart';

class SpawnFiveLetterReviewList extends StatelessWidget {
  const SpawnFiveLetterReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Q Fives',
        'Five letter words with Q',
        () {
          return searchForIncludes(5, ["Q"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'J Fives',
        'Five letter words with J',
        () {
          return searchForIncludes(5, ["J"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'X Fives',
        'Fives letter words with X',
        () {
          return searchForIncludes(5, ["X"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Z Fours',
        'Five letter words with Z',
        () {
          return searchForIncludes(5, ["Z"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'K Fives',
        'Fives letter words with K',
        () {
          return searchForIncludes(5, ["K"], provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('5 Letter Review List'),
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
