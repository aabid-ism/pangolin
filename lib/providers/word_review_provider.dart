import 'package:flutter/material.dart';
import 'package:pangolin/enums/lexicon.dart';
import 'package:pangolin/services/save_favorites.dart';
import 'package:pangolin/services/save_theme.dart';
import 'package:pangolin/words/CSW21/CSW21_2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordStateProvider extends ChangeNotifier {
  final String initialThemeString;
  WordStateProvider(this.initialThemeString);
  late String current = "";
  late int currentIndex = 0;
  late Lexicon lexicon;
  late List<String> wordList = [];
  late List<String> searchWordList = [];

  bool isReviewDone = false;

  var history = <String>[];
  GlobalKey? historyListKey;

  var favorites = <String>[];
  late SharedPreferences prefs;

  late String themeColor = initialThemeString;
  // void initializeFavorites() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  void changeThemeColor(String inputColor) {
    themeColor = inputColor;
    saveThemeColor(themeColor);
    notifyListeners();
  }

  Future<void> initializeAppState(String? inputLexicon) async {
    if (inputLexicon == Lexicon.NWL20.lexiconString) {
      lexicon = Lexicon.NWL20;
    } else {
      lexicon = Lexicon.CSW21;
    }
    themeColor = await getThemeColor() ?? "Orange";
    notifyListeners();
  }

  Future<void> loadHomePageWordList() async {
    // history = ["hi"];

    await loadFavoritesToWordList();
    if (wordList.isNotEmpty) {
    } else {
      launchStartUpWords(); // makes WordList = ["Scrabble", "is" ...]
    }
    current = wordList[0];
    favorites = wordList;
    currentIndex = 0;
    isReviewDone = false;
    history = [];
    // print(wordList);
    notifyListeners();
  }

  Future<void> loadFavoritesToWordList() async {
    List<String> favorites = await loadFavorites();
    wordList = favorites;
    currentIndex = 0;
    if (wordList.isEmpty) {
      current = "SCRABBLE";
    } else {
      current = wordList[0];
    }
  }

  void changeSearchWordList(List<String> inputWordList) {
    searchWordList = inputWordList;
    notifyListeners();
  }

  void launchReview(Function searchFunction) async {
    wordList = await searchFunction();
    isReviewDone = false;
    currentIndex = 0;
    history = [];
    current = wordList[0];
  }

  void launchForReview(var words) async {
    wordList = words;
    isReviewDone = false;
    currentIndex = 0;
    history = [];
    current = wordList[0];
  }

  void makeSearchBecomeReviewWordList() {
    history = [];
    isReviewDone = false;
    currentIndex = 0;
    wordList = searchWordList;
    current = wordList[0];
    notifyListeners();
  }

  void changeLexicon(Lexicon newLexicon) {
    lexicon = newLexicon;
    notifyListeners();
  }

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    currentIndex += 1;
    if (currentIndex >= wordList.length) {
      isReviewDone = true;
    } else {
      current = wordList[currentIndex];
    }

    notifyListeners();
  }

  void toggleFavorite([String? myWord]) {
    myWord = myWord ?? current;
    if (favorites.contains(myWord)) {
      favorites.remove(myWord);
      removeFromFavorites(myWord);
    } else {
      saveToFavorites(myWord);
      favorites.add(myWord);
    }
    notifyListeners();
  }

  void removeFavorite(String myWord) {
    favorites.remove(myWord);
    removeFromFavorites(myWord);
    notifyListeners();
  }

  void launchStartUpWords() {
    wordList = ["SCRABBLE", "IS", "FUN", "INTENSE", "CREATIVE", "BEAUTIFUL"];
    for (var word in wordList) {
      saveToFavorites(word);
    }
    favorites = wordList;
  }
}
