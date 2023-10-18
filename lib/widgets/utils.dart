import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pangolin/pages/custom_review_page.dart";
import "package:pangolin/providers/word_review_provider.dart";

class ReviewTile {
  final String title;
  final String subtitle;
  Function reviewFunction;

  ReviewTile(this.title, this.subtitle, this.reviewFunction);

  void onPressed(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));

    var provider = Provider.of<WordStateProvider>(context, listen: false);
    var words = await reviewFunction();

    provider.launchForReview(words);

    if (!context.mounted) return;
    Navigator.of(context).pop();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CustomReviewPage(
                appBarTitle: title,
              )),
    );
  }
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

Future<List<String>> combineWordResults(
    List<Future<List<String>>> futures) async {
  // Use Future.wait to await all the futures and get their results
  List<List<String>> results = await Future.wait(futures);

  // Combine the individual lists of strings into a single list
  List<String> combinedResults = results.expand((list) => list).toList();

  return combinedResults;
}
