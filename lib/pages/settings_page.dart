import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrabbly/providers/word_review_provider.dart";
import "package:scrabbly/widgets/download_popup.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var appState = context.watch<WordStateProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Current Lexicon: ${appState.lexicon.lexiconString}"),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const DownloadPopup();
                },
              ),
              child: const Text("Change Lexicon"),
            ),
          ],
        ),
      ),
    );
  }
}
