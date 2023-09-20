import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrabbly/pages/favorites_page.dart";
import "package:scrabbly/pages/generator_page.dart";
import "package:scrabbly/pages/review_page.dart";
import "package:scrabbly/pages/review_topics_page.dart";
import 'package:scrabbly/pages/search_page.dart';
import "package:scrabbly/pages/settings_page.dart";
import "package:scrabbly/providers/word_review_provider.dart";
import "package:scrabbly/widgets/download_popup.dart";

class MyHomePage extends StatefulWidget {
  final String? lexicon;
  const MyHomePage(this.lexicon, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // First time launching the app
      Provider.of<WordStateProvider>(context, listen: false)
          .initializeAppState(widget.lexicon);
      if (widget.lexicon == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Provider.of<WordStateProvider>(context, listen: false)
          //     .launchStartUpWords();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DownloadPopup();
            },
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = SearchPage();
        break;
      case 2:
        page = ReviewTopicsPage();
        break;
      case 3:
        page = FavoritesPage();
      case 4:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  top: false,
                  bottom: false,
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.home),
                        label: 'Home',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.search_sharp),
                        label: 'Search',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.menu_book_rounded),
                        label: 'Review',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.favorite),
                        label: 'Favorites',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: 'Settings',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
