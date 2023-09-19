import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/quran_helper.dart';
import '../helpers/bookmark_helper.dart';
import '../helpers/verse_helper.dart';
import '../models/bookmark.dart';
import '../models/quran_aya.dart';
import '../providers/quran_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  late List<QuranAya> allVerses =
      Provider.of<QuranProvider>(context, listen: false).allVersesOfQuran;
  final List<QuranAya> _filteredVerses = [];

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
        (verse) => VerseHelper.getTamilTranslation(verse)
            .toLowerCase()
            .contains(query.toLowerCase()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text('குர்ஆனில் தேடுக'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
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
                decoration: const InputDecoration(
                    hintText: 'தேட வேண்டிய சொல்லை உள்ளிடுக',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredVerses.length,
                  itemBuilder: (context, index) {
                    QuranAya verse = _filteredVerses[index];
                    String translation = VerseHelper.getTamilTranslation(verse);
                    String query = _searchController.text;

                    RegExp regExp = RegExp(query, caseSensitive: false);

                    List<TextSpan> textSpans = [];

                    int currentIndex = 0;
                    regExp.allMatches(translation).forEach((match) {
                      if (currentIndex < match.start) {
                        textSpans.add(TextSpan(
                          text:
                              translation.substring(currentIndex, match.start),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ));
                      }

                      textSpans.add(
                        TextSpan(
                          text: translation.substring(match.start, match.end),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      );

                      currentIndex = match.end;
                    });

                    if (currentIndex < translation.length) {
                      textSpans.add(TextSpan(
                        text: translation.substring(currentIndex),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${verse.suraNumber}:${verse.ayaNumber}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              PopupMenuButton<String>(
                                color: Colors.green.shade100,
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      VerseHelper.shareVerse(
                                          VerseHelper.getVerseCopy(
                                              verse, 'copy'));
                                    },
                                    child:
                                        getPopupMenuItem(Icons.share, 'Share'),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      BookmarkHelper.addBookmark(
                                        Bookmark(
                                          suraNumber:
                                              verse.suraNumber.toString(),
                                          verseNumber:
                                              verse.ayaNumber.toString(),
                                        ),
                                        context,
                                      );
                                    },
                                    child: getPopupMenuItem(
                                        Icons.bookmark_add_outlined,
                                        'Add Bookmark'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'copy',
                                    onTap: () {
                                      VerseHelper.copyToClipboard(
                                          VerseHelper.getVerseCopy(
                                              verse, 'copy'),
                                          context);
                                    },
                                    child: getPopupMenuItem(
                                        Icons.copy, 'Copy Arabic + Tamil'),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      VerseHelper.copyToClipboard(
                                          VerseHelper.getVerseCopy(
                                              verse, 'copy_arabic'),
                                          context);
                                    },
                                    child: getPopupMenuItem(
                                        Icons.copy, 'Copy Arabic'),
                                  ),
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      VerseHelper.copyToClipboard(
                                          VerseHelper.getVerseCopy(
                                              verse, 'copy_tamil'),
                                          context);
                                    },
                                    child: getPopupMenuItem(
                                        Icons.copy, 'Copy Tamil'),
                                  ),
                                ],
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
                                  ' ${verse.arabic}${QuranHelper.getVerseEndSymbol(verse.ayaNumber)}',
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
      ),
    );
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: Colors.green.shade700,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
