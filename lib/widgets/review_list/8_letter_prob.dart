import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/review_list/2_letter_list.dart';
import 'package:pangolin/widgets/review_list/utils.dart';

class SpawnEightProbReviewList extends StatelessWidget {
  const SpawnEightProbReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Top 25 Eights',
        'Words 0 to 25 ranked by probability order',
        () {
          return searchForProbability(8, 0, 25, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '25 to 50 Eights',
        'Words 25 to 50 ranked by probability order',
        () {
          return searchForProbability(
              8, 25, 50, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '50 to 75 Eights',
        'Words 50 to 75 ranked by probability order',
        () {
          return searchForProbability(
              8, 50, 75, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '75 to 100 Eights',
        'Words 75 to 100 ranked by probability order',
        () {
          return searchForProbability(
              7, 75, 100, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '100 to 150 Eights',
        'Words 100 to 150 ranked by probability order',
        () {
          return searchForProbability(
              7, 100, 150, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '150 to 200 Eights',
        'Words 150 to 200 ranked by probability order',
        () {
          return searchForProbability(
              7, 150, 200, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '200 to 250 Eights',
        'Words 200 to 250 ranked by probability order',
        () {
          return searchForProbability(
              7, 200, 250, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '250 to 300 Eights',
        'Words 250 to 300 ranked by probability order',
        () {
          return searchForProbability(
              7, 250, 300, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '300 to 350 Eights',
        'Words 300 to 350 ranked by probability order',
        () {
          return searchForProbability(
              7, 300, 350, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '350 to 400 Eights',
        'Words 350 to 400 ranked by probability order',
        () {
          return searchForProbability(
              7, 350, 400, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '400 to 450 Eights',
        'Words 400 to 450 ranked by probability order',
        () {
          return searchForProbability(
              7, 400, 450, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '450 to 500 Eights',
        'Words 450 to 500 ranked by probability order',
        () {
          return searchForProbability(
              7, 450, 500, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '500 to 550 Eights',
        'Words 500 to 550 ranked by probability order',
        () {
          return searchForProbability(
              7, 500, 550, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '550 to 600 Eights',
        'Words 550 to 600 ranked by probability order',
        () {
          return searchForProbability(
              7, 550, 600, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '600 to 650 Eights',
        'Words 600 to 650 ranked by probability order',
        () {
          return searchForProbability(
              7, 600, 650, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '650 to 700 Eights',
        'Words 650 to 700 ranked by probability order',
        () {
          return searchForProbability(
              7, 650, 700, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '700 to 750 Eights',
        'Words 700 to 750 ranked by probability order',
        () {
          return searchForProbability(
              7, 700, 750, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '750 to 800 Eights',
        'Words 750 to 800 ranked by probability order',
        () {
          return searchForProbability(
              7, 750, 800, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '800 to 850 Eights',
        'Words 800 to 850 ranked by probability order',
        () {
          return searchForProbability(
              7, 800, 850, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '850 to 900 Eights',
        'Words 850 to 900 ranked by probability order',
        () {
          return searchForProbability(
              7, 850, 900, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '900 to 950 Eights',
        'Words 900 to 950 ranked by probability order',
        () {
          return searchForProbability(
              7, 900, 950, provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        '950 to 1000 Eights',
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
        title: const Text('Eights by Probability'),
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
