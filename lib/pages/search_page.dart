import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrabbly/providers/word_review_provider.dart";
import "package:scrabbly/widgets/search_form.dart";

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<WordStateProvider>();

    // if (appState.favorites.isEmpty) {
    //   return const Center(
    //     child: Text('No favorites yet.'),
    //   );
    // }

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(padding: const EdgeInsets.all(30), child: SearchForm()),
    //   ],
    // );
    return SearchForm();
  }
}
