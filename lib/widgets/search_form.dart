import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pangolin/pages/custom_review_page.dart';
import 'package:pangolin/providers/word_review_provider.dart';
import 'package:pangolin/services/process_definition.dart';
import 'package:pangolin/services/search_service.dart';
import 'package:pangolin/widgets/definitions_popup.dart';
import 'package:pangolin/widgets/download_popup.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  SearchFormState createState() {
    return SearchFormState();
  }
}

class SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final minController = TextEditingController();
  final maxController = TextEditingController();
  // Dropdowns
  String _searchTypeDropdownValue = "Anagram";
  List<String> searchTypeOptions = [
    "Anagram",
    "Pattern",
    "Probability",
    "Includes"
  ];

  int _lengthDropdownValue = 2;
  List<int> lengthOptions = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  bool isLoading = false;
  Timer? _debounce;
  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<WordStateProvider>();

    Future<void> displayWordList(String inputText) async {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      setState(() {
        isLoading = true;
      });
      _debounce = Timer(const Duration(milliseconds: 200), () async {
        late List<String> result;
        if (_searchTypeDropdownValue == "Anagram") {
          result = await searchForAnagrams(
              inputText, provider.lexicon.lexiconString);
        } else if (_searchTypeDropdownValue == "Pattern") {
          result = await searchForPatterns(
              inputText, provider.lexicon.lexiconString);
        } else {
          RegExp regex = RegExp(r'^[a-zA-Z]+$');
          if (regex.hasMatch(inputText)) {
            int lengthOfString = lengthOptions.indexOf(_lengthDropdownValue);
            result = await searchForIncludes(lengthOfString + 2,
                inputText.split(''), provider.lexicon.lexiconString);
          } else {
            result = [];
          }
        }
        provider.changeSearchWordList(result);
        setState(() {
          isLoading = false;
        });
      });
    }

    Future<void> displayProbability(int length, String min, String max) async {
      int parsedLength = length;
      int parsedMin = int.tryParse(min) ?? 0;
      int parsedMax = int.tryParse(max) ?? 0;

      if (_debounce?.isActive ?? false) _debounce?.cancel();
      setState(() {
        isLoading = true;
      });
      _debounce = Timer(const Duration(milliseconds: 200), () async {
        var result = await searchForProbability(
            parsedLength, parsedMin, parsedMax, provider.lexicon.lexiconString);
        provider.changeSearchWordList(result);
        setState(() {
          isLoading = false;
        });
      });
    }

    void searchTypeDropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _searchTypeDropdownValue = selectedValue;
          if (selectedValue == "Probability") {
          } else {
            displayWordList(myController.text);
          }
        });
      }
    }

    void lengthDropdownCallback(int? selectedValue) {
      if (selectedValue is int) {
        setState(() {
          _lengthDropdownValue = selectedValue ?? 7;
          if (_searchTypeDropdownValue == "Probability") {
            displayProbability(
                _lengthDropdownValue, minController.text, maxController.text);
          } else {
            displayWordList(myController.text);
          }
        });
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DownloadPopup();
                  },
                );
              },
              child: Text(provider.lexicon.lexiconString),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Search-Type DropDown
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(right: 100),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // dropdownColor: Theme.of(context).colorScheme.surfaceVariant,

                              items: searchTypeOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String searchTypeName) {
                                return DropdownMenuItem<String>(
                                    value: searchTypeName,
                                    child: Text(searchTypeName));
                              }).toList(),
                              value: _searchTypeDropdownValue,
                              onChanged: searchTypeDropdownCallback,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Length DropDown
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: lengthOptions
                                .map<DropdownMenuItem<int>>((int lengthOption) {
                              return DropdownMenuItem<int>(
                                  value: lengthOption,
                                  child: Text("$lengthOption Letter"));
                            }).toList(),
                            value: _lengthDropdownValue,
                            onChanged:
                                (_searchTypeDropdownValue == "Probability" ||
                                        _searchTypeDropdownValue == "Includes")
                                    ? lengthDropdownCallback
                                    : null,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_searchTypeDropdownValue != "Probability")
                    Row(
                      children: [
                        // SearchField
                        Expanded(
                          child: TextFormField(
                            controller: myController,
                            autofocus: false,
                            onChanged: (value) => {displayWordList(value)},
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: myController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                              focusColor: Colors.green,
                              fillColor: Theme.of(context).highlightColor,
                              border: const OutlineInputBorder(),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue),
                              //   borderRadius: BorderRadius.circular(10.0),
                              // ),
                              hintText: 'Search Term',
                              // labelText: 'Name *',
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              // if (value.length == 1) {
                              //   return 'Please enter more than one character';
                              // }
                              return null;
                            },
                          ),
                        ),

                        // Insert Blank
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Add your button's click logic here
                        //     myController.text = "${myController.text}?";
                        //     myController.selection = TextSelection.fromPosition(
                        //         TextPosition(offset: myController.text.length));
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Theme.of(context).primaryColor,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(100.0),
                        //     ),
                        //     // padding: const EdgeInsets.all(16.0),
                        //   ),
                        //   child: const Icon(
                        //     Icons
                        //         .question_mark_rounded, // Using the "clear" icon for the cross
                        //     // size: 32.0,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),

                  // PROBABILITY OPTION
                  if (_searchTypeDropdownValue == "Probability")
                    Row(
                      children: [
                        // MIN
                        Expanded(
                          child: TextFormField(
                            controller: minController,
                            autofocus: false,
                            // onChanged: (value) => {displayAnagrams(value)},
                            decoration: InputDecoration(
                              labelText: "Min",
                              suffixIcon: IconButton(
                                onPressed: minController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                              focusColor: Colors.green,
                              fillColor: Theme.of(context).highlightColor,
                              border: const OutlineInputBorder(),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue),
                              //   borderRadius: BorderRadius.circular(10.0),
                              // ),
                              hintText: '0',
                              // labelText: 'Name *',
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  int.tryParse(value) == null) {
                                return 'Please enter an integer';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: maxController,
                            autofocus: false,
                            // onChanged: (value) => {displayAnagrams(value)},
                            decoration: InputDecoration(
                              labelText: "Max",
                              suffixIcon: IconButton(
                                onPressed: maxController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                              focusColor: Colors.green,
                              fillColor: Theme.of(context).highlightColor,
                              border: const OutlineInputBorder(),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue),
                              //   borderRadius: BorderRadius.circular(10.0),
                              // ),
                              hintText: '100',
                              // labelText: 'Name *',
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  int.tryParse(value) == null) {
                                return 'Please enter an integer';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  // Search Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              if (_searchTypeDropdownValue == "Probability") {
                                displayProbability(_lengthDropdownValue,
                                    minController.text, maxController.text);
                              } else {
                                displayWordList(myController.text);
                              }
                            }
                          },
                          child: const Text('Search'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // REVIEW BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() &&
                                provider.searchWordList.isNotEmpty) {
                              print("aiyo");
                              // launch review
                              provider.makeSearchBecomeReviewWordList();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomReviewPage()),
                              );
                            }
                          },
                          child: const Text('Review'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      provider.searchWordList.isEmpty
                          ? const SizedBox(height: 1)
                          : Text(
                              "${provider.searchWordList.length} word results")
                    ],
                  ),
                ],
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : provider.searchWordList.isEmpty
                    ? const Center(child: Text('No Search Results'))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.searchWordList.length,
                          prototypeItem: const ListTile(
                            title: Text("Scrabble"),
                          ),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.topLeft),
                                onPressed: () => {
                                  processDefinition(
                                      context, provider.searchWordList[index])
                                },
                                child: Text(provider.searchWordList[index]),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  provider.toggleFavorite(
                                      provider.searchWordList[index]);
                                },
                                icon: provider.favorites.contains(
                                        provider.searchWordList[index])
                                    ? const Icon(Icons.favorite, size: 12)
                                    : const Icon(Icons.favorite_border,
                                        size: 12),
                                // label: Text(
                                //   provider.searchWordList[index],
                                //   semanticsLabel:
                                //       provider.searchWordList[index],
                                // ),
                              ),
                            );
                          },
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
