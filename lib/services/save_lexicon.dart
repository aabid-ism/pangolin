import 'package:shared_preferences/shared_preferences.dart';

void saveLexicon(String lexiconString) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("lexicon", lexiconString);
}
