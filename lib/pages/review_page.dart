import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/review_mapentry.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/review_card.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late List<MapEntry<String, Function>> firstRow;
  Widget _buildFirstRowItemList(BuildContext context, int index) {
    var provider = Provider.of<WordStateProvider>(context, listen: false);
    firstRow = [
      wordMapEntry(
        context,
        "2 Letters",
        searchForPatterns("??", provider.lexicon.lexiconString),
      ),
      wordMapEntry(context, "3 Letters with \n Q",
          searchForIncludes(3, ["Q"], provider.lexicon.lexiconString)),
      wordMapEntry(
        context,
        "3 Letters with \n J",
        searchForIncludes(3, ["J"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "3 Letters with \n X",
        searchForIncludes(3, ["X"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "3 Letters with \n Z",
        searchForIncludes(3, ["Z"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "3 Letters with \n K",
        searchForIncludes(3, ["K"], provider.lexicon.lexiconString),
      ),
    ];
    var list = firstRow;
    if (index == list.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: 150,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReviewCard(
              heading: list[index].key, onPressed: () => list[index].value())
        ],
      ),
    );
  }

  Widget _buildSecondRowItemList(BuildContext context, int index) {
    var provider = Provider.of<WordStateProvider>(context, listen: false);
    firstRow = [
      wordMapEntry(context, "4 Letters with \n Q",
          searchForIncludes(4, ["Q"], provider.lexicon.lexiconString)),
      wordMapEntry(
        context,
        "4 Letters with \n J",
        searchForIncludes(4, ["J"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n X",
        searchForIncludes(4, ["X"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n Z",
        searchForIncludes(4, ["Z"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n K",
        searchForIncludes(4, ["K"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n F",
        searchForIncludes(4, ["F"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n H",
        searchForIncludes(4, ["H"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n V",
        searchForIncludes(4, ["V"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n W",
        searchForIncludes(4, ["W"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "4 Letters with \n Y",
        searchForIncludes(4, ["Y"], provider.lexicon.lexiconString),
      ),
    ];
    var list = firstRow;
    if (index == list.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: 150,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReviewCard(
              heading: list[index].key, onPressed: () => list[index].value())
        ],
      ),
    );
  }

  Widget _buildThirdRowItemList(BuildContext context, int index) {
    var provider = Provider.of<WordStateProvider>(context, listen: false);
    firstRow = [
      wordMapEntry(context, "5 Letters with \n Q",
          searchForIncludes(5, ["Q"], provider.lexicon.lexiconString)),
      wordMapEntry(
        context,
        "5 Letters with \n J",
        searchForIncludes(5, ["J"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "5 Letters with \n X",
        searchForIncludes(5, ["X"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "5 Letters with \n Z",
        searchForIncludes(5, ["Z"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "5 Letters with \n K",
        searchForIncludes(5, ["K"], provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "Top 100 \n Fives",
        searchForProbability(5, 0, 250, provider.lexicon.lexiconString),
      ),
    ];
    var list = firstRow;
    if (index == list.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: 150,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReviewCard(
              heading: list[index].key, onPressed: () => list[index].value())
        ],
      ),
    );
  }

  Widget _buildFourthRowItemList(BuildContext context, int index) {
    var provider = Provider.of<WordStateProvider>(context, listen: false);
    firstRow = [
      wordMapEntry(
        context,
        "Top 100 \n Sevens",
        searchForProbability(7, 0, 100, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "100 - 250 \n Sevens",
        searchForProbability(7, 100, 250, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "250 - 500 \n Sevens",
        searchForProbability(7, 250, 500, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "500 - 750 \n Sevens",
        searchForProbability(7, 500, 750, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "750 - 1000 \n Sevens",
        searchForProbability(7, 750, 1000, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "Top 100 \n Eights",
        searchForProbability(8, 0, 100, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "100 - 250 \n Eights",
        searchForProbability(8, 100, 250, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "250 - 500 \n Eights",
        searchForProbability(8, 250, 500, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "500 - 750 \n Eights",
        searchForProbability(8, 500, 750, provider.lexicon.lexiconString),
      ),
      wordMapEntry(
        context,
        "750 - 1000 \n Eights",
        searchForProbability(8, 750, 1000, provider.lexicon.lexiconString),
      ),
    ];
    var list = firstRow;
    if (index == list.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: 150,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReviewCard(
              heading: list[index].key, onPressed: () => list[index].value())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              flex: 1,
              child: Text("2-3 Letter Words"),
            ),
            // ROW 1
            Expanded(
              flex: 6,
              child: ScrollSnapList(
                itemBuilder: _buildFirstRowItemList,
                onItemFocus: (e) => print("Card Focused: $e"),
                itemSize: 150,
                dynamicItemSize: true,
                onReachEnd: () {},
                // Need to update itemCount manually here
                itemCount: 6,
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text("4 Letter Words"),
            ),
            Expanded(
              flex: 6,
              child: ScrollSnapList(
                itemBuilder: _buildSecondRowItemList,
                onItemFocus: (e) => print("Card Focused: $e"),
                itemSize: 150,
                dynamicItemSize: true,
                onReachEnd: () {},
                // Need to update itemCount manually here
                itemCount: 10,
              ),
            ),
            const Expanded(
              child: Text("5 Letter Words"),
            ),
            Expanded(
              flex: 6,
              child: ScrollSnapList(
                itemBuilder: _buildThirdRowItemList,
                onItemFocus: (e) => print("Card Focused: $e"),
                itemSize: 150,
                dynamicItemSize: true,
                onReachEnd: () {},
                // Need to update itemCount manually here
                itemCount: 6,
              ),
            ),
            const Expanded(
              child: Text("7-8 Letter Words"),
            ),
            Expanded(
              flex: 6,
              child: ScrollSnapList(
                itemBuilder: _buildFourthRowItemList,
                onItemFocus: (e) => print("Card Focused: $e"),
                itemSize: 150,
                dynamicItemSize: true,
                onReachEnd: () {},
                // Need to update itemCount manually here
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
