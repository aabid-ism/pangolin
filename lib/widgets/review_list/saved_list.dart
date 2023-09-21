import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrabbly/enums/lexicon.dart';
import 'package:scrabbly/pages/custom_review_page.dart';
import 'package:scrabbly/providers/word_review_provider.dart';
import 'package:scrabbly/services/save_review.dart';
import 'package:scrabbly/services/search_service.dart';
import 'package:scrabbly/widgets/review_list/2_letter_list.dart';
import 'package:scrabbly/widgets/review_list/utils.dart';

class SpawnSavedList extends StatelessWidget {
  const SpawnSavedList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Slot One',
        'Save your unfinished quiz here',
        () {
          return Future.value(getWordsFromPrefs("Slot 1"));
        },
      ),
      ReviewTile(
        'Slot Two',
        'Review your unfinished quiz 2 here',
        () {
          return Future.value(getWordsFromPrefs("Slot 2"));
        },
      ),
      ReviewTile(
        'Slot Three',
        'Save your unfinished quiz 3 here',
        () {
          return Future.value(getWordsFromPrefs("Slot 3"));
        },
      ),
      ReviewTile(
        'Slot Four',
        'Save your unfinished quiz 4 here',
        () {
          return Future.value(getWordsFromPrefs("Slot 4"));
        },
      ),
      ReviewTile(
        'Slot Five',
        'Save your unfinished quiz 5 here',
        () {
          return Future.value(getWordsFromPrefs("Slot 5"));
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('Saved Review Lists'),
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
