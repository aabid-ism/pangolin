// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrabbly/pages/favorites_page.dart';
import 'package:scrabbly/pages/generator_page.dart';
import 'package:scrabbly/pages/home_page.dart';
import 'package:scrabbly/pages/search_page.dart';
import 'package:scrabbly/services/save_theme.dart';
import 'package:scrabbly/widgets/download_popup.dart';
import "providers/word_review_provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // await Permission.storage.request();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? lexicon = prefs.getString("lexicon");
  String? initialThemeString = await getThemeColor();
  runApp(MyApp(lexicon, initialThemeString));
}

class MyApp extends StatefulWidget {
  final String? lexicon;
  final String? initialThemeString;
  const MyApp(this.lexicon, this.initialThemeString, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Color> themeColorsMap = {
    'Emerald': Colors.lightGreen,
    'Pink': Colors.pinkAccent,
    'Blue Grey': Colors.blueGrey,
    'Sepia': Colors.orangeAccent,
    'Red Accent': Colors.redAccent,
    // Add other theme colors as needed
  };
  @override
  Widget build(BuildContext context) {
    print("refreshed main.dart");
    return ChangeNotifierProvider(
        create: (context) =>
            WordStateProvider(widget.initialThemeString ?? "Blue Grey"),
        builder: (context, child) {
          return MaterialApp(
            title: 'Scrabbly',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: themeColorsMap[
                          Provider.of<WordStateProvider>(context, listen: true)
                              .themeColor] ??
                      Colors.redAccent),
            ),
            home: MyHomePage(widget.lexicon),
          );
        });
  }
}
