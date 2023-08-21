import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';

import '../models/bookmark.dart';

class BookmarkHelper {
  static const String _bookmarkKey = 'bookmarkList';

  // Add a bookmark to the list
  static void addBookmark(Bookmark bookmark) {

    final List<String> bookmarkList = Preferences.getStringList(_bookmarkKey) ?? [];

    bookmarkList.add('${bookmark.suraNumber}:${bookmark.verseNumber}');
    Preferences.setStringList(_bookmarkKey, bookmarkList);
  }

  // Delete a bookmark from the list
  static void deleteBookmark(Bookmark bookmark) {
    final List<String>? bookmarkList = Preferences.getStringList(_bookmarkKey);

    if (bookmarkList != null) {
      bookmarkList.remove('${bookmark.suraNumber}:${bookmark.verseNumber}');
     Preferences.setStringList(_bookmarkKey, bookmarkList);
    }
  }

  // Get the list of bookmarks
  static List<Bookmark> getBookmarkList() {
   final List<String> bookmarkList = Preferences.getStringList(_bookmarkKey) ?? [];

    return bookmarkList.map((bookmarkString) {
      final parts = bookmarkString.split(':');
      return Bookmark(suraNumber: parts[0], verseNumber: parts[1]);
    }).toList();
  }
}
