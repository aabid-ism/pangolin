import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pangolin/providers/word_review_provider.dart";
import "package:pangolin/widgets/download_popup.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<WordStateProvider>();

    void changeThemeColor(String inputColor) {
      setState(() {
        appState.changeThemeColor(inputColor);
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pangolin-trans.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  const Color.fromARGB(255, 172, 122, 13),
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
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18, // You can adjust the size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text(
                        'What are the words on the home page?',
                        style: TextStyle(
                          fontSize: 15, // You can adjust the size as needed
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // subtitle: Text('Trailing expansion arrow icon'),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Those are the words you have liked. You can change this list in the Favorites tab.'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'I saved a Review. Where did it go?',
                        style: TextStyle(
                          fontSize: 15, // You can adjust the size as needed
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // subtitle: Text('Trailing expansion arrow icon'),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Go to the Review tab. Then click on the \'Saved\' button. You can view your saved Reviews here.'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'How do I create a custom Review?',
                        style: TextStyle(
                          fontSize: 15, // You can adjust the size as needed
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // subtitle: Text('Trailing expansion arrow icon'),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Step 1: Search for words in the Search tab.'),
                        ),
                        ListTile(
                          title: Text('Step 2: Click on the Review Button.'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'How do I save a Review?',
                        style: TextStyle(
                          fontSize: 15, //
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Text(
                                'The save button is located in the bottom right corner of a review.')),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'I clicked \'next\' before liking a word during a word review. What do i do now?',
                        style: TextStyle(
                          fontSize: 15, //
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'The history view of words is scrollable and clickable. You can like and unlike a word by simply clicking it.'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'I have a suggestion for the app. How and where do I communicate that?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Please write your feedback as a comment on the Play Store or App Store page.'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
