import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrabbly/enums/lexicon.dart';
import 'package:scrabbly/pages/custom_review_page.dart';
import 'package:scrabbly/providers/word_review_provider.dart';
import 'package:scrabbly/services/search_service.dart';
import 'package:scrabbly/widgets/review_list/2_letter_list.dart';
import 'package:scrabbly/widgets/review_list/utils.dart';

class SpawnSevenLetterReviewList extends StatelessWidget {
  const SpawnSevenLetterReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var provider = Provider.of<WordStateProvider>(context, listen: false);

    List<ReviewTile> myReviewTiles = [
      ReviewTile(
        'RETAIN',
        'Words that match the anagrams of RETAIN?',
        () {
          return searchForAnagrams("RETAIN?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'TISANE',
        'Words that match the anagrams of TISANE?',
        () {
          return searchForAnagrams("TISANE?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'SATIRE',
        'Words that match the anagrams of SATIRE?',
        () {
          return searchForAnagrams("SATIRE?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'ARSINE',
        'Words that match the anagrams of ARSINE?',
        () {
          return searchForAnagrams("ARSINE?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'SENIOR',
        'Words that match the anagrams of SENIOR?',
        () {
          return searchForAnagrams("SENIOR?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'TONIES',
        'Words that match the anagrams of TONIES?',
        () {
          return searchForAnagrams("TONIES?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'ORIENT',
        'Words that match the anagrams of ORIENT?',
        () {
          return searchForAnagrams("ORIENT?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'TORIES',
        'Words that match the anagrams of TORIES?',
        () {
          return searchForAnagrams("TORIES?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'SANTER',
        'Words that match the anagrams of SANTER?',
        () {
          return searchForAnagrams("SANTER?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'INSERT',
        'Words that match the anagrams of INSERT?',
        () {
          return searchForAnagrams("INSERT?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'STONER',
        'Words that match the anagrams of STONER?',
        () {
          return searchForAnagrams("STONER?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'STONER',
        'Words that match the anagrams of STONER?',
        () {
          return searchForAnagrams("STONER?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'SERIAL',
        'Words that match the anagrams of SERIAL?',
        () {
          return searchForAnagrams("SERIAL?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'NAILER',
        'Words that match the anagrams of NAILER?',
        () {
          return searchForAnagrams("NAILER?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'SALINE',
        'Words that match the anagrams of SALINE?',
        () {
          return searchForAnagrams("SALINE?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'ORATES',
        'Words that match the anagrams of ORATES?',
        () {
          return searchForAnagrams("ORATES?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'REASON',
        'Words that match the anagrams of REASON?',
        () {
          return searchForAnagrams("REASON?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'ATONES',
        'Words that match the anagrams of ATONES?',
        () {
          return searchForAnagrams("ATONES?", provider.lexicon.lexiconString);
        },
      ),
      ReviewTile(
        'ATONER',
        'Words that match the anagrams of ATONER?',
        () {
          return searchForAnagrams("ATONER?", provider.lexicon.lexiconString);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceVariant,
        title: const Text('Sevens by Stems'),
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
