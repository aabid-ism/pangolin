import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/review_list/2_letter_list.dart';
import 'package:pangolin/widgets/review_list/utils.dart';

class SpawnThreeLetterReviewList extends StatelessWidget {
  const SpawnThreeLetterReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'Q Threes',
        'Three letter words with Q',
        () {
          return searchForIncludes(3, ["Q"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'J Threes',
        'Three letter words with J',
        () {
          return searchForIncludes(3, ["J"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'X Threes',
        'Three letter words with X',
        () {
          return searchForIncludes(3, ["X"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Z Threes',
        'Three letter words with Z',
        () {
          return searchForIncludes(3, ["Z"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'K Threes',
        'Three letter words with K',
        () {
          return searchForIncludes(3, ["K"], provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'All Vowels',
        'Three letter words with three vowels',
        () {
          return provider.lexicon == Lexicon.CSW21
              ? Future.value(["AIA", "AUA", "AUE", "EAU"])
              : Future.value(["EAU"]);
        },
      ),
      ReviewTile(
        'Alpha Threes',
        'Three letter words starting with A',
        () {
          return searchForPatterns("A??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Butterfly Threes',
        'Three letter words starting with B',
        () {
          return searchForPatterns("B??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Chimpanzee Threes',
        'Three letter words starting with C',
        () {
          return searchForPatterns("C??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Donkey Threes',
        'Three letter words starting with D',
        () {
          return searchForPatterns("D??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Elephant Threes',
        'Three letter words starting with E',
        () {
          return searchForPatterns("E??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Firefly Threes',
        'Two letter words starting with F',
        () {
          return searchForPatterns("F??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Gorilla Threes',
        'Three letter words starting with G',
        () {
          return searchForPatterns("G??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Hunter Threes',
        'Three letter words starting with H',
        () {
          return searchForPatterns("H??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Iguana Threes',
        'Three letter words starting with I',
        () {
          return searchForPatterns("I??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Lobster Threes',
        'Three letter words starting with L',
        () {
          return searchForPatterns("L??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Magpie Threes',
        'Three letter words starting with M',
        () {
          return searchForPatterns("M??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Nightingale Threes',
        'Three letter words starting with N',
        () {
          return searchForPatterns("N??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Octopus Threes',
        'Three letter words starting with O',
        () {
          return searchForPatterns("O??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Penguin Threes',
        'Three letter words starting with P',
        () {
          return searchForPatterns("P??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Ratatouille Threes',
        'Three letter words starting with R',
        () {
          return searchForPatterns("R??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Seahorse Threes',
        'Three letter words starting with S',
        () {
          return searchForPatterns("S??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Tiger Threes',
        'Three letter words starting with T',
        () {
          return searchForPatterns("T??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Umbrella Threes',
        'Three letter words starting with U',
        () {
          return searchForPatterns("U??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Vampire Threes',
        'Three letter words starting with V',
        () {
          return searchForPatterns("V??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Woodpecker Threes',
        'Three letter words starting with W',
        () {
          return searchForPatterns("W??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'Yolo Threes',
        'Three letter words starting with Y',
        () {
          return searchForPatterns("Y??", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'All Together',
        'All three letter words',
        () {
          return searchForPatterns("???", provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('3 Letter Review List'),
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
