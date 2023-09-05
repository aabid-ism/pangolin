import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrabbly/enums/lexicon.dart';
import 'package:scrabbly/providers/word_review_provider.dart';
import 'package:scrabbly/services/load_lexicon.dart';
import 'package:scrabbly/services/save_lexicon.dart';

class DownloadPopup extends StatelessWidget {
  const DownloadPopup({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize Loading Service
    var provider = Provider.of<WordStateProvider>(context, listen: false);
    return AlertDialog(
      title: const Text('Choose your lexicon'),
      // content: const Text('Click on the Lexicon you want to download'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            provider.changeLexicon(Lexicon.CSW21);
            saveLexicon("CSW21");
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("CSW21"),
        ),
        TextButton(
          onPressed: () {
            provider.changeLexicon(Lexicon.NWL20);
            saveLexicon("NWL20");
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("NWL20"),
        ),
      ],
    );
  }
}
