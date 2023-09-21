import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrabbly/models/BigCard.dart";
import "package:scrabbly/providers/word_review_provider.dart";
import "package:scrabbly/services/get_definition.dart";
import "package:scrabbly/services/process_definition.dart";
import "package:scrabbly/widgets/definitions_popup.dart";
import "package:scrabbly/widgets/download_popup.dart";
import "package:scrabbly/widgets/review_list/utils.dart";

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<WordStateProvider>(context, listen: false);
      provider.loadHomePageWordList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // using context.watch to react to provider changes dynamically
    var appState = context.watch<WordStateProvider>();
    var displayWord = appState.current;

    IconData icon;
    if (appState.favorites.contains(displayWord)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (appState.history.isNotEmpty)
          const Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          const SizedBox(height: 10),
          BigCard(pair: displayWord),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: appState.isReviewDone
                    ? null
                    : () {
                        appState.getNext();
                      },
                child: const Text('Next'),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => {
                  processDefinition(context, displayWord),
                },
                child: const Text('Definition'),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "${(appState.wordList.length - appState.currentIndex).toString()} words left")
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.

  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<WordStateProvider>();
    var _key = GlobalKey();

    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: const EdgeInsets.only(top: 100),
        initialItemCount: appState.history.length,
        itemBuilder: (context, index, animation) {
          final historyWord =
              appState.history.isEmpty ? '' : appState.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.toggleFavorite(historyWord);
                },
                icon: appState.favorites.contains(historyWord)
                    ? const Icon(Icons.favorite, size: 12)
                    : const SizedBox(),
                label: Text(
                  historyWord,
                  semanticsLabel: historyWord,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
