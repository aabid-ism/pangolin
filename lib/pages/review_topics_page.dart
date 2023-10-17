import 'package:flutter/material.dart';
import 'package:pangolin/widgets/number_button.dart';
import 'package:pangolin/widgets/review_list/2_letter_list.dart';
import 'package:pangolin/widgets/review_list/3_letter_list.dart';
import 'package:pangolin/widgets/review_list/4_letter_list.dart';
import 'package:pangolin/widgets/review_list/5_letter_list.dart';
import 'package:pangolin/widgets/review_list/7_letter_list.dart';
import 'package:pangolin/widgets/review_list/7_letter_prob_list.dart';
import 'package:pangolin/widgets/review_list/8_letter_prob.dart';
import 'package:pangolin/widgets/review_list/saved_list.dart';

class ReviewTopicsPage extends StatefulWidget {
  const ReviewTopicsPage({super.key});

  @override
  State<ReviewTopicsPage> createState() => _ReviewTopicsPageState();
}

class _ReviewTopicsPageState extends State<ReviewTopicsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberBox(
              number: "2",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnTwoLetterReviewList()),
                );
              },
            ),
            NumberBox(
              number: "3",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnThreeLetterReviewList()),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberBox(
              number: "4",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnFourLetterReviewList()),
                );
              },
            ),
            NumberBox(
              number: "5",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnFiveLetterReviewList()),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberBox(
              number: "7",
              subtitle: "stem",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnSevenLetterReviewList()),
                );
              },
            ),
            NumberBox(
              number: "7",
              subtitle: "prob",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnSevenProbReviewList()),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberBox(
              number: "8",
              subtitle: "prob",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnEightProbReviewList()),
                );
              },
            ),
            NumberBox(
              number: "S",
              subtitle: "Saved",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpawnSavedList()),
                );
              },
            ),
          ],
        ),
      ],
    ));
  }
}
