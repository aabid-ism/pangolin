import "package:flutter/material.dart";
import 'package:pangolin/pages/saved_list.dart';
import 'package:pangolin/widgets/custom_name_for_review.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/widgets/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveReview(BuildContext context) async {
  // Show circular progress
  buildShowDialog(context);

  // Get the word list
  Future.delayed(const Duration(seconds: 2));

  var provider = Provider.of<WordStateProvider>(context, listen: false);
  var words = provider.wordList.sublist(provider.currentIndex);
  // Pop off circular progress
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();
  List<String> customNames = await retrieveCustomNames();
  // Show a dialog with definitions
  // ignore: use_build_context_synchronously
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Save for later'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                showCustomReviewNamePopUp(context, "Slot 1", words);
              },
              child: Text(customNames[0]),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                showCustomReviewNamePopUp(context, "Slot 2", words);
              },
              child: Text(customNames[1]),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                showCustomReviewNamePopUp(context, "Slot 3", words);
              },
              child: Text(customNames[2]),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                showCustomReviewNamePopUp(context, "Slot 4", words);
              },
              child: Text(customNames[3]),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                showCustomReviewNamePopUp(context, "Slot 5", words);
              },
              child: Text(customNames[4]),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}

// Function to save a list of words to SharedPreferences
Future<void> saveWordsToPrefs(List<String> words, String listKey) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonWords = jsonEncode(words);
  await prefs.setString(listKey, jsonWords);
}

// Function to retrieve a list of words from SharedPreferences
Future<List<String>> getWordsFromPrefs(String listKey) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonWords = prefs.getString(listKey);

  if (jsonWords == null) {
    return [""];
  }

  final words = jsonDecode(jsonWords);
  return List<String>.from(words);
}

// Function to save a custom name under a listKey
Future<void> saveWordListName(String listKey, String customName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('${listKey}name', customName);
}

Future<String> getWordListName(String listKey) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('${listKey}name') ?? listKey;
}

savedSuccessSnackBar(int slot, BuildContext context) {
  var snackBar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    content: const Text('Successfully saved to review later!'),
    duration: const Duration(seconds: 1), // Adjust the duration here
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
