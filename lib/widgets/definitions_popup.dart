import 'package:flutter/material.dart';
import 'package:scrabbly/services/get_definition.dart';

class DefinitionsPopup extends StatelessWidget {
  final String displayWord;

  DefinitionsPopup({Key? key, required this.displayWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(displayWord);
    return FutureBuilder<List<List<String>>>(
      future: getWordDefinitions(displayWord), // Call the function here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return AlertDialog(
            title: const Text('No Definition Found'),
            content: Text('An error occurred: ${snapshot.error}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return AlertDialog(
            title: Text('Word: $displayWord'),
            content: const Text('No definitions found.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        } else {
          final wordDefinitions = snapshot.data!;

          return AlertDialog(
            title: Text('Word: $displayWord'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: wordDefinitions.map((definitionList) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Part of Speech: ${definitionList[0]}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Definition: ${definitionList[1]}'),
                    ],
                  ),
                );
              }).toList(),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        }
      },
    );
  }
}
