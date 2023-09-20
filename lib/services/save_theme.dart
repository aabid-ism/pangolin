import 'package:shared_preferences/shared_preferences.dart';

void saveThemeColor(String themeColor) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("themeColor", themeColor);
}

Future<String?> getThemeColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("themeColor");
}
