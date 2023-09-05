import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrabbly/providers/word_review_provider.dart";
import '../pages/custom_review_page.dart';

MapEntry<String, Function> wordMapEntry(
    context, String heading, Future<List<String>> searchFunction) {
  var provider = Provider.of<WordStateProvider>(context, listen: false);
  return MapEntry(
    heading,
    () async {
      // Set the wordList
      provider.launchReview(
        () => searchFunction,
      );
      // Launch screen
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CustomReviewPage()),
      );
    },
  );
}
