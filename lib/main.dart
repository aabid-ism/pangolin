// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrabbly/pages/favorites_page.dart';
import 'package:scrabbly/pages/generator_page.dart';
import 'package:scrabbly/pages/home_page.dart';
import 'package:scrabbly/pages/search_page.dart';
import 'package:scrabbly/widgets/download_popup.dart';
import "providers/word_review_provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // await Permission.storage.request();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? lexicon = prefs.getString("lexicon");
  runApp(MyApp(lexicon));
}

class MyApp extends StatelessWidget {
  final String? lexicon;
  const MyApp(this.lexicon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordStateProvider(),
      child: MaterialApp(
        title: 'Scrabbly',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        ),
        home: MyHomePage(lexicon),
      ),
    );
  }
}
