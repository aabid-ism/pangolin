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

    void changeThemeColor(String inputColor) {
      setState(() {
        appState.changeThemeColor(inputColor);
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(
                  height: 30,
                ),
                // Text("Current Theme: ${appState.themeColor}"),
                Text("Current Theme: ${appState.themeColor}"),

                Row(
                  children: [
                    CircleButton(
                      Color.fromARGB(255, 172, 122, 13),
                      () => changeThemeColor("Sepia"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleButton(
                      Colors.pinkAccent,
                      () => changeThemeColor("Pink"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleButton(
                      Colors.lightGreen.shade700,
                      () => changeThemeColor("Emerald"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleButton(
                      Colors.blueGrey,
                      () => changeThemeColor("Blue Grey"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleButton(
                      Colors.red,
                      () => changeThemeColor("Red Accent"),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // CircleButton(
                    //   Colors.grey,
                    //   () => changeThemeColor("ind"),
                    // ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () => showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return const DownloadPopup();
                //     },
                //   ),
                //   child: const Text("Change Theme"),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Color color;
  final Function onPressed;

  const CircleButton(this.color, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(); // Call the onPressed function with the selected color
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20,
      ),
    );
  }
}
