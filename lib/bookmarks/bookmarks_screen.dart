import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/bookmarks.dart';
import '../read_quran/quran_aya.dart';
import '../read_quran/sura_translation_screen.dart';
import '../app_config/color_config.dart';
import '../bookmarks/bookmark.dart';
import '../providers/quran_provider.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      body: quranProvider.bookmarkList.isEmpty
          ? const Center(
              child: Text(
                BookmarksTexts.bookmarksWillAppearHere,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemCount: quranProvider.bookmarkList.length,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color:
                    quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
              ),
              itemBuilder: (context, index) {
                Bookmark currentBookmark = quranProvider.bookmarkList[index];
                return ListTile(
                  onTap: () => onBookmarkSelected(
                    int.parse(currentBookmark.suraNumber),
                    int.parse(currentBookmark.verseNumber),
                  ),
                  leading: CircleAvatar(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            '${currentBookmark.suraNumber}:${currentBookmark.verseNumber}'),
                      ),
                    ),
                  ),
                  title: RichText(
                    text: quranProvider
                        .getArabicAyaListFromTranslation(quranProvider.filterOneAyaTranslationFromSearch(
                        int.parse(currentBookmark.suraNumber),
                        int.parse(currentBookmark.verseNumber)), 16),
                    textDirection: TextDirection.rtl,

                  ),
                  subtitle: Text(quranProvider
                      .filterOneAyaTranslationFromSearch(
                          int.parse(currentBookmark.suraNumber),
                          int.parse(currentBookmark.verseNumber))
                      .text),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      quranProvider.deleteBookmark(
                          Bookmark(
                              suraNumber: currentBookmark.suraNumber,
                              verseNumber: currentBookmark.verseNumber),
                          context);
                    },
                  ),
                );
              },
            ),
    );
  }

  void onBookmarkSelected(int selectedSura, int selectedVerse) {
    quranProvider.selectedSuraNumber = selectedSura;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SuraTranslationScreen(
                  goToVerse: findAyaIndex(selectedSura, selectedVerse),
                )));
  }


  int findAyaIndex(int selectedSura, int selectedAyaNumber){
    List<QuranAya> allAyasInSura = quranProvider.allSurasTamil[selectedSura-1].listOfAyas;

    int ayaIndex = allAyasInSura.indexWhere(
            (element) => element.ayaNumberList.contains(selectedAyaNumber.toString()));

    return ayaIndex + 1;
  }
}
