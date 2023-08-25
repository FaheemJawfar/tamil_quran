import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/bookmark_helper.dart';
import 'package:tamil_quran/helpers/verse_options.dart';
import 'package:tamil_quran/models/bookmark.dart';
import '../providers/quran_provider.dart';
import '../screens/read_sura_translation.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late final quranProvider = context.read<QuranProvider>();
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
          ? const Center(child: Text('Your bookmark will appear here!'))
          : ListView.separated(
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
                    child: Text(
                        '${currentBookmark.suraNumber}:${currentBookmark.verseNumber}'),
                  ),
                  title: Text(getSuraName(currentBookmark.suraNumber)),
                  subtitle: Text(getVerse(
                      currentBookmark.suraNumber, currentBookmark.verseNumber)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BookmarkHelper.deleteBookmark(Bookmark(
                          suraNumber: currentBookmark.suraNumber,
                          verseNumber: currentBookmark.verseNumber));
                      getBookmarks();
                    },
                  ),
                );
              },
            ),
    );
  }

  getSuraName(String suraNumber) {
    return quranProvider.suraList[int.parse(suraNumber) - 1].tamilName;
  }

  getVerse(String suraNumber, String verseNumber) {
    return VerseHelper.getTamilTranslation(quranProvider.filterOneVerse(
        int.parse(suraNumber), int.parse(verseNumber)));
  }

  void onBookmarkSelected(int selectedSura, int selectedVerse) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReadSuraTranslation(
                  scrollTo: selectedVerse,
                )));
  }
}
