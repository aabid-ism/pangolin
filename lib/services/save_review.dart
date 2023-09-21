import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:scrabbly/providers/word_review_provider.dart';
import "package:scrabbly/services/get_definition.dart";
import "package:scrabbly/widgets/review_list/utils.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveReview(BuildContext context) async {
  // Show circular progress
  buildShowDialog(context);

  // Get the word list
  Future.delayed(Duration(seconds: 2));

  var provider = Provider.of<WordStateProvider>(context, listen: false);
  var words = provider.wordList.sublist(provider.currentIndex);
  // Pop off circular progress
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();

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
                buildShowDialog(context);
                await saveWordsToPrefs(words, "Slot 1");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                savedSuccessSnackBar(1, context);
              },
              child: const Text("Slot 1"),
            ),
            TextButton(
              onPressed: () async {
                buildShowDialog(context);
                await saveWordsToPrefs(words, "Slot 2");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                savedSuccessSnackBar(2, context);
              },
              child: const Text("Slot 2"),
            ),
            TextButton(
              onPressed: () async {
                buildShowDialog(context);
                await saveWordsToPrefs(words, "Slot 3");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                savedSuccessSnackBar(3, context);
              },
              child: const Text("Slot 3"),
            ),
            TextButton(
              onPressed: () async {
                buildShowDialog(context);
                await saveWordsToPrefs(words, "Slot 4");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                savedSuccessSnackBar(4, context);
              },
              child: const Text("Slot 4"),
            ),
            TextButton(
              onPressed: () async {
                buildShowDialog(context);
                await saveWordsToPrefs(words, "Slot 5");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                savedSuccessSnackBar(5, context);
              },
              child: const Text("Slot 5"),
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

savedSuccessSnackBar(int slot, BuildContext context) {
  var snackBar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    content: Text('Successfully saved to slot $slot '),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
