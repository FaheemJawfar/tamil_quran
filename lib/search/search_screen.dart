import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../app_texts/search_texts.dart';
import '../read_quran/sura_translation_screen.dart';
import '../app_config/color_config.dart';
import '../read_quran/verse_helper.dart';
import '../bookmarks/bookmark.dart';
import '../read_quran/quran_aya.dart';
import '../providers/quran_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);
  final List<QuranAya> _filteredVerses = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchVerses(String query) {
    _filteredVerses.clear();

    if (query.isNotEmpty) {
      for (var sura in quranProvider.allSurasTamil) {
        _filteredVerses.addAll(sura.searchWord(query));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text(SearchTexts.searchInQuran),
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
                    _searchVerses(query);
                  });
                },
                decoration: const InputDecoration(
                    hintText: SearchTexts.enterWordToSearch,
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _filteredVerses.length,
                  itemBuilder: (context, index) {
                    QuranAya translation = _filteredVerses[index];
                    String query = _searchController.text;

                    RegExp regExp = RegExp(query, caseSensitive: false);

                    List<TextSpan> textSpans = [];

                    int currentIndex = 0;
                    regExp.allMatches(translation.text).forEach((match) {
                      if (currentIndex < match.start) {
                        textSpans.add(TextSpan(
                          text: translation.text
                              .substring(currentIndex, match.start),
                          style: TextStyle(
                            color: quranProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ));
                      }

                      textSpans.add(
                        TextSpan(
                          text: translation.text
                              .substring(match.start, match.end),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      );

                      currentIndex = match.end;
                    });

                    if (currentIndex < translation.text.length) {
                      textSpans.add(TextSpan(
                        text: translation.text.substring(currentIndex),
                        style: TextStyle(
                          color: quranProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
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
                                '${translation.suraIndex}:${translation.ayaNumberList}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              PopupMenuButton<String>(
                                color: quranProvider.isDarkMode
                                    ? null
                                    : Colors.green.shade100,
                                onSelected: (String value) {
                                  switch (value) {
                                    case 'goToVerse':
                                      quranProvider.selectedSuraNumber =
                                          translation.suraIndex;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SuraTranslationScreen(
                                                    goToVerse:
                                                        translation.ayaIndex,
                                                  )));
                                      break;
                                    case 'shareVerse':
                                      Share.share(
                                          VerseHelper.getVerseCopy(
                                              quranProvider
                                                  .filterOneAyaTranslation(
                                                      translation.suraIndex,
                                                      translation.ayaIndex),
                                              'copy', context));
                                      break;
                                    case 'addBookmark':
                                      quranProvider.addBookmark(
                                        Bookmark(
                                          suraNumber:
                                              translation.suraIndex.toString(),
                                          verseNumber:
                                              translation.ayaIndex.toString(),
                                        ),
                                        context,
                                      );
                                      break;
                                    case 'copy':
                                      VerseHelper.copyToClipboard(
                                        VerseHelper.getVerseCopy(
                                            quranProvider
                                                .filterOneAyaTranslation(
                                                    translation.suraIndex,
                                                    translation.ayaIndex),
                                            'copy', context),
                                        context,
                                      );
                                      break;
                                    case 'copy_arabic':
                                      VerseHelper.copyToClipboard(
                                          VerseHelper.getVerseCopy(
                                              quranProvider
                                                  .filterOneAyaTranslation(
                                                      translation.suraIndex,
                                                      translation.ayaIndex),
                                              'copy_arabic', context),
                                          context);

                                      break;
                                    case 'copy_translation':
                                      VerseHelper.copyToClipboard(
                                          VerseHelper.getVerseCopy(
                                              quranProvider
                                                  .filterOneAyaTranslation(
                                                      translation.suraIndex,
                                                      translation.ayaIndex),
                                              'copy_translation', context),
                                          context);
                                      break;
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: 'goToVerse',
                                    child: getPopupMenuItem(
                                        Icons.navigation_outlined,
                                        'Go to Verse'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'shareVerse',
                                    child: getPopupMenuItem(
                                        Icons.share, SearchTexts.popUpShare),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'addBookmark',
                                    child: getPopupMenuItem(
                                        Icons.bookmark_add_outlined,
                                        SearchTexts.popUpAddBookmark),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'copy',
                                    child: getPopupMenuItem(
                                        Icons.copy,
                                        SearchTexts
                                            .popUpCopyArabicAndTranslation),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'copy_arabic',
                                    child: getPopupMenuItem(Icons.copy,
                                        SearchTexts.popUpCopyArabic),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'copy_translation',
                                    child: getPopupMenuItem(Icons.copy,
                                        SearchTexts.popUpCopyTranslation),
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
                                child: RichText(
                                  text: quranProvider.getArabicAyaListFromTranslation(translation, quranProvider.arabicFontSize),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  children: textSpans,
                                  style: TextStyle(
                                    fontSize: quranProvider.tamilFontSize,
                                    fontFamily: quranProvider.tamilFont,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      iconColor: quranProvider.isDarkMode ? null : ColorConfig.buttonColor,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
