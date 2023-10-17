import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/review_list/2_letter_list.dart';
import 'package:pangolin/widgets/review_list/utils.dart';

class SpawnFourLetterReviewList extends StatelessWidget {
  const SpawnFourLetterReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Q Fours',
        'Four letter words with Q',
        () {
          return searchForIncludes(4, ["Q"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'J Fours',
        'Four letter words with J',
        () {
          return searchForIncludes(4, ["J"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'X Fours',
        'Fours letter words with X',
        () {
          return searchForIncludes(4, ["X"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Z Fours',
        'Fours letter words with Z',
        () {
          return searchForIncludes(4, ["Z"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'K Fours',
        'Fours letter words with K',
        () {
          return searchForIncludes(4, ["K"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Alpha Fours',
        'Four letter words starting with A',
        () {
          return searchForPatterns("A???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Butterfly Fours',
        'Four letter words starting with B',
        () {
          return searchForPatterns("B???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Chimpanzee Fours',
        'Four letter words starting with C',
        () {
          return searchForPatterns("C???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Donkey Fours',
        'Four letter words starting with D',
        () {
          return searchForPatterns("D???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Elephant Fours',
        'Four letter words starting with E',
        () {
          return searchForPatterns("E???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Firefly Fours',
        'Four letter words starting with F',
        () {
          return searchForPatterns("F???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Gorilla Fours',
        'Four letter words starting with G',
        () {
          return searchForPatterns("G???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Hunter Fours',
        'Four letter words starting with H',
        () {
          return searchForPatterns("H???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Iguana Fours',
        'Four letter words starting with I',
        () {
          return searchForPatterns("I???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Lobster Fours',
        'Four letter words starting with L',
        () {
          return searchForPatterns("L???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Magpie Fours',
        'Four letter words starting with M',
        () {
          return searchForPatterns("M???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Nightingale Fours',
        'Four letter words starting with N',
        () {
          return searchForPatterns("N???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Octopus Fours',
        'Four letter words starting with O',
        () {
          return searchForPatterns("O???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Penguin Fours',
        'Four letter words starting with P',
        () {
          return searchForPatterns("P???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Ratatouille Fours',
        'Four letter words starting with R',
        () {
          return searchForPatterns("R???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Seahorse Fours',
        'Four letter words starting with S',
        () {
          return searchForPatterns("S???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Tiger Fours',
        'Four letter words starting with T',
        () {
          return searchForPatterns("T???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Umbrella Fours',
        'Four letter words starting with U',
        () {
          return searchForPatterns("U???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Vampire Fours',
        'Four letter words starting with V',
        () {
          return searchForPatterns("V???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Woodpecker Fours',
        'Four letter words starting with W',
        () {
          return searchForPatterns("W???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Yolo Fours',
        'Four letter words starting with Y',
        () {
          return searchForPatterns("Y???", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'All Together',
        'All four letter words',
        () {
          return searchForPatterns("????", provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('4 Letter Review List'),
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
