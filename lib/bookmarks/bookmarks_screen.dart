import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
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
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: quranProvider.bookmarkList.length,
              itemBuilder: (context, index) {
                Bookmark currentBookmark = quranProvider.bookmarkList[index];
                final suraNumber = int.parse(currentBookmark.suraNumber);
                final verseNumber = int.parse(currentBookmark.verseNumber);
                final ayaTranslation = quranProvider
                    .filterOneAyaTranslationFromSearch(suraNumber, verseNumber);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: quranProvider.isDarkMode
                        ? const Color(0xFF1E1E1E)
                        : ColorConfig.popupColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withAlpha(quranProvider.isDarkMode ? 40 : 15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: quranProvider.isDarkMode
                          ? Colors.white10
                          : ColorConfig.primaryColor.withAlpha(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => onBookmarkSelected(suraNumber, verseNumber),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      ColorConfig.primaryColor.withAlpha(30),
                                  child: Text(
                                    '$suraNumber:$verseNumber',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConfig.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text:
                                  quranProvider.getArabicAyaListFromTranslation(
                                      ayaTranslation, 20),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              ayaTranslation.text,
                              style: TextStyle(
                                fontSize: 14,
                                color: quranProvider.isDarkMode
                                    ? Colors.white70
                                    : Colors.black87,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon:
                                      const Icon(LucideIcons.trash2, size: 18),
                                  color: quranProvider.isDarkMode
                                      ? Colors.white38
                                      : Colors.black38,
                                  onPressed: () {
                                    quranProvider.deleteBookmark(
                                        Bookmark(
                                            suraNumber:
                                                currentBookmark.suraNumber,
                                            verseNumber:
                                                currentBookmark.verseNumber),
                                        context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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

  int findAyaIndex(int selectedSura, int selectedAyaNumber) {
    List<QuranAya> allAyasInSura =
        quranProvider.allSurasTamil[selectedSura - 1].listOfAyas;

    int ayaIndex = allAyasInSura.indexWhere((element) =>
        element.ayaNumberList.contains(selectedAyaNumber.toString()));

    return ayaIndex + 1;
  }
}
