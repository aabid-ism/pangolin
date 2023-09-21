import "package:flutter/material.dart";
import "package:scrabbly/services/get_definition.dart";
import "package:scrabbly/widgets/review_list/utils.dart";

Future<void> processDefinition(BuildContext context, String displayWord) async {
  // Show circular progress
  buildShowDialog(context);

  // Get definitions
  var defs = await getWordDefinitions(displayWord);
  int endIndex = 3;
  if (endIndex > defs.length) {
    endIndex = defs.length;
  }

  // Slice and retrieve the lists
  List<List<String>> slicedDefs = defs.sublist(0, endIndex);
  // Pop off circular progress
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();

  // Show a dialog with definitions
  // ignore: use_build_context_synchronously
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Word: $displayWord'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: slicedDefs.map((definitionList) {
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
    },
  );
}
