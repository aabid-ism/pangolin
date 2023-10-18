import 'package:flutter/material.dart';
import 'package:pangolin/services/save_review.dart';
import 'package:pangolin/widgets/utils.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/save_lexicon.dart';

void showCustomReviewNamePopUp(
    BuildContext context, String slotNumber, List<String> words) {
  TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Save Review in $slotNumber',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name for Review",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  buildShowDialog(context);
                  // save words under correct slot number
                  await saveWordsToPrefs(words, slotNumber);
                  // save name under correct slot number
                  await saveCustomNameToPrefs(slotNumber, nameController.text);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  savedSuccessSnackBar(2, context);
                },
                child: const Text("Save Review"),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<void> saveCustomNameToPrefs(String listKey, String customName) async {
  String savingName = customName;
  if (customName == "") {
    savingName = listKey;
  }
  await saveWordListName(listKey, savingName);
}
