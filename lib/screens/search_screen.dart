import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

import '../models/translation_model.dart';
import '../providers/quran_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  late List<TranslationModel> allVerses =
      context.read<QuranProvider>().translations;
  final List<TranslationModel> _filteredVerses = [];

  @override
  void initState() {
    super.initState();
    _filteredVerses.addAll(allVerses);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchVerses(String query) {
    _filteredVerses.clear();

    if (query.isEmpty) {
      _filteredVerses.addAll(allVerses);
    } else {
      _filteredVerses.addAll(allVerses.where(
        (verse) => verse.mJohn.toLowerCase().contains(query.toLowerCase()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('குர்ஆனில் தேடுக'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                setState(() {
                  _filteredVerses.clear();
                  _searchVerses(query);
                });
              },
              decoration: InputDecoration(
                  hintText: 'தேட வேண்டிய சொல்லை உள்ளிடுக',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _filteredVerses.length,
                itemBuilder: (context, index) {
                  TranslationModel verse = _filteredVerses[index];
                  String mJohn = verse.mJohn;
                  String query = _searchController.text;

                  // Create a regular expression pattern for the query
                  RegExp regExp = RegExp(query, caseSensitive: false);

                  List<TextSpan> textSpans = [];

                  int currentIndex = 0;
                  regExp.allMatches(mJohn).forEach((match) {
                    if (currentIndex < match.start) {
                      // Add non-matching text before the match
                      textSpans.add(TextSpan(
                        text: mJohn.substring(currentIndex, match.start),
                        style: TextStyle(
                          color: Colors.black,
                          // Customize the color as needed
                        ),
                      ));
                    }

                    // Add matching text with custom styling
                    textSpans.add(
                      TextSpan(
                        text: mJohn.substring(match.start, match.end),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          // Customize the color as needed
                        ),
                      ),
                    );

                    currentIndex = match.end;
                  });

                  if (currentIndex < mJohn.length) {
                    // Add any remaining non-matching text
                    textSpans.add(TextSpan(
                      text: mJohn.substring(currentIndex),
                      style: TextStyle(
                        color: Colors.black,
                        // Customize the color as needed
                      ),
                    ));
                  }

                  // return ListTile(
                  //   title: Text(verse.arabic),
                  //   subtitle: RichText(
                  //     text: TextSpan(children: textSpans),
                  //   ),
                  //   // Add any additional fields you want to display
                  // );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${verse.sura}:${verse.aya}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            PopupMenuButton<String>(
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'option1',
                                  child: Text('Option 1'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'option2',
                                  child: Text('Option 2'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'option3',
                                  child: Text('Option 3'),
                                ),
                              ],
                              onSelected: (String value) {
                                switch (value) {
                                  case 'option1':
                                    // Handle option 1 selection
                                    break;
                                  case 'option2':
                                    // Handle option 2 selection
                                    break;
                                  case 'option3':
                                    // Handle option 3 selection
                                    break;
                                }
                              },
                              child: const Icon(Icons.more_vert),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                ' ${verse.arabic}${getVerseEndSymbol(verse.aya)}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   verse.mJohn,
                            //   style: const TextStyle(fontSize: 14),
                            // ),

                            RichText(
                              text: TextSpan(children: textSpans),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
