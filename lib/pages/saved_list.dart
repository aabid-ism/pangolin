import 'package:flutter/material.dart';
import 'package:pangolin/services/save_review.dart';
import 'package:pangolin/widgets/utils.dart';

class SpawnSavedList extends StatelessWidget {
  const SpawnSavedList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    // Use a FutureBuilder to retrieve custom names from SharedPreferences
    return FutureBuilder(
      future: retrieveCustomNames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> customNames = snapshot.data ??
              ["Slot One", "Slot Two", "Slot Three", "Slot Four", "Slot Five"];

          List<ReviewTile> myReviewTiles = [
            ReviewTile(
              customNames[0],
              'Your unfinished quiz 1 is here',
              () {
                return Future.value(getWordsFromPrefs("Slot 1"));
              },
            ),
            ReviewTile(
              customNames[1],
              'Your unfinished quiz 2 is here',
              () {
                return Future.value(getWordsFromPrefs("Slot 2"));
              },
            ),
            ReviewTile(
              customNames[2],
              'Your unfinished quiz 3 is here',
              () {
                return Future.value(getWordsFromPrefs("Slot 3"));
              },
            ),
            ReviewTile(
              customNames[3],
              'Your unfinished quiz 4 is here',
              () {
                return Future.value(getWordsFromPrefs("Slot 4"));
              },
            ),
            ReviewTile(
              customNames[4],
              'Your unfinished quiz 5 is here',
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
        } else {
          // Handle loading state or errors here
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

Future<List<String>> retrieveCustomNames() async {
  List<String> customNames = [];
  customNames.add(await getWordListName("Slot 1"));
  customNames.add(await getWordListName("Slot 2"));
  customNames.add(await getWordListName("Slot 3"));
  customNames.add(await getWordListName("Slot 4"));
  customNames.add(await getWordListName("Slot 5"));
  print(customNames);
  return customNames;
}
