import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<List<String>>> getWordDefinitions(String word) async {
  final apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Extract definitions from the API response
      List<List<String>> definitionsList = [];

      for (var entry in data) {
        if (entry.containsKey('meanings')) {
          for (var meaning in entry['meanings']) {
            if (meaning.containsKey('partOfSpeech')) {
              String partOfSpeech = meaning['partOfSpeech'];
              List<String> definitions = [partOfSpeech];

              if (meaning.containsKey('definitions')) {
                var firstDefinition = meaning['definitions'][0];
                if (firstDefinition.containsKey('definition')) {
                  definitions.add(firstDefinition['definition']);
                }
              }
              definitionsList.add(definitions);
            }
          }
        }
      }

      return definitionsList;
    } else {
      return [
        ["N/A", "Couldn't Load Definition"]
      ];
    }
  } catch (e) {
    return [
      ["N/A", "No Definition Found"]
    ];
  }
}
///////////////////////
//// UNIT TESTING ////
/////////////////////

// void main() async {
//   try {
//     List<List<String>> wordDefinitions = await getWordDefinitions('mail');
//     for (var definitionList in wordDefinitions) {
//       print('Part of Speech: ${definitionList[0]}');
//       if (definitionList.length > 1) {
//         print('First Definition: ${definitionList[1]}');
//       } else {
//         print('No definition found.');
//       }
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
