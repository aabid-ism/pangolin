import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding and decoding

Future<List<String>> saveToFavorites(String favWord) async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'favorites';

  // Retrieve the current list of favorites or initialize an empty list
  List<String>? favoritesList = jsonDecode(prefs.getString(key) ?? '[]')
      .whereType<String>()
      .toList() as List<String>;

  // Add the new favorite word to the list
  favoritesList.add(favWord);

  // // Convert the list to List<String>
  // List<String> stringFavoritesList =
  //     favoritesList.map((item) => item.toString()).toList();

  // Save the updated list back to SharedPreferences
  await prefs.setString(key, jsonEncode(favoritesList));

  return favoritesList;
}

Future<void> removeFromFavorites(String favWord) async {
  final prefs = await SharedPreferences.getInstance();
  String key = 'favorites';

  // Retrieve the current list of favorites or initialize an empty list
  List<String> favoritesList = jsonDecode(prefs.getString(key) ?? '[]')
      .whereType<String>()
      .toList() as List<String>;

  // Remove the specified word from the list
  favoritesList.remove(favWord);

  // Serialize the updated list to JSON
  final newFavoritesList = jsonEncode(favoritesList);

  // Save the updated list back to SharedPreferences
  await prefs.setString(key, newFavoritesList);
}

Future<List<String>> loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  String key = 'favorites';

  // Retrieve the list of favorites or return an empty list if none is found
  List<String> favorites = jsonDecode(prefs.getString(key) ?? '[]')
      .whereType<String>()
      .toList() as List<String>;

  // Cast the dynamic list to a list of strings
  // List<String> favoritesList =
  //     favoritesDynamicList.map((item) => item.toString()).toList();

  return favorites;
}
