import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrabbly/enums/lexicon.dart';
import 'package:scrabbly/pages/custom_review_page.dart';
import 'package:scrabbly/providers/word_review_provider.dart';
import 'package:scrabbly/services/search_service.dart';
import 'package:scrabbly/widgets/review_list/2_letter_list.dart';
import 'package:scrabbly/widgets/review_list/utils.dart';

class SpawnSevenProbReviewList extends StatelessWidget {
  const SpawnSevenProbReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Top 25 Sevens',
        'Words 0 to 25 ranked by probability order',
        () {
          return searchForProbability(7, 0, 25, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '25 to 50 Sevens',
        'Words 25 to 50 ranked by probability order',
        () {
          return searchForProbability(
              7, 25, 50, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '50 to 75 Sevens',
        'Words 25 to 50 ranked by probability order',
        () {
          return searchForProbability(
              7, 50, 75, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '75 to 100 Sevens',
        'Words 75 to 100 ranked by probability order',
        () {
          return searchForProbability(
              7, 75, 100, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '100 to 150 Sevens',
        'Words 100 to 150 ranked by probability order',
        () {
          return searchForProbability(
              7, 100, 150, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '150 to 200 Sevens',
        'Words 150 to 200 ranked by probability order',
        () {
          return searchForProbability(
              7, 150, 200, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '200 to 250 Sevens',
        'Words 200 to 250 ranked by probability order',
        () {
          return searchForProbability(
              7, 200, 250, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '250 to 300 Sevens',
        'Words 250 to 300 ranked by probability order',
        () {
          return searchForProbability(
              7, 250, 300, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '300 to 350 Sevens',
        'Words 300 to 350 ranked by probability order',
        () {
          return searchForProbability(
              7, 300, 350, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '350 to 400 Sevens',
        'Words 350 to 400 ranked by probability order',
        () {
          return searchForProbability(
              7, 350, 400, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '400 to 450 Sevens',
        'Words 400 to 450 ranked by probability order',
        () {
          return searchForProbability(
              7, 400, 450, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '450 to 500 Sevens',
        'Words 450 to 500 ranked by probability order',
        () {
          return searchForProbability(
              7, 450, 500, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '500 to 550 Sevens',
        'Words 500 to 550 ranked by probability order',
        () {
          return searchForProbability(
              7, 500, 550, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '550 to 600 Sevens',
        'Words 550 to 600 ranked by probability order',
        () {
          return searchForProbability(
              7, 550, 600, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '600 to 650 Sevens',
        'Words 600 to 650 ranked by probability order',
        () {
          return searchForProbability(
              7, 600, 650, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '650 to 700 Sevens',
        'Words 650 to 700 ranked by probability order',
        () {
          return searchForProbability(
              7, 650, 700, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '700 to 750 Sevens',
        'Words 700 to 750 ranked by probability order',
        () {
          return searchForProbability(
              7, 700, 750, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '750 to 800 Sevens',
        'Words 750 to 800 ranked by probability order',
        () {
          return searchForProbability(
              7, 750, 800, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '800 to 850 Sevens',
        'Words 800 to 850 ranked by probability order',
        () {
          return searchForProbability(
              7, 800, 850, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '850 to 900 Sevens',
        'Words 850 to 900 ranked by probability order',
        () {
          return searchForProbability(
              7, 850, 900, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '900 to 950 Sevens',
        'Words 900 to 950 ranked by probability order',
        () {
          return searchForProbability(
              7, 900, 950, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '950 to 1000 Sevens',
        'Words 950 to 1000 ranked by probability order',
        () {
          return searchForProbability(
              7, 950, 1000, provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('Sevens by Probability'),
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
