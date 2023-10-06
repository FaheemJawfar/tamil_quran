import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/screens/sura_translation_screen.dart';
import '../config/color_config.dart';
import '../helpers/bookmark_helper.dart';
import '../models/bookmark.dart';
import '../providers/quran_provider.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  List<Bookmark> bookmarkList = [];

  @override
  void initState() {
    super.initState();
    getBookmarks();
  }

  getBookmarks() async {
    setState(() {
      bookmarkList = BookmarkHelper.getBookmarkList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      body: bookmarkList.isEmpty
          ? const Center(
        child: Text(
          'நீங்கள் பதிவு செய்த Bookmark களை இங்கே காணலாம்!',
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemCount: bookmarkList.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: ColorConfig.primaryColor,
        ),
        itemBuilder: (context, index) {
          Bookmark currentBookmark = bookmarkList[index];
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
            title: Text(quranProvider.filterOneAyaArabic(
                int.parse(currentBookmark.suraNumber), int.parse(currentBookmark.verseNumber)).text,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontFamily: quranProvider.arabicFont),
            ),
            subtitle: Text(quranProvider.filterOneAyaTranslation(
                int.parse(currentBookmark.suraNumber), int.parse(currentBookmark.verseNumber)).text),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                BookmarkHelper.deleteBookmark(
                    Bookmark(
                        suraNumber: currentBookmark.suraNumber,
                        verseNumber: currentBookmark.verseNumber),
                    context);
                getBookmarks();
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
              goToVerse: selectedVerse,
            )));
  }
}
