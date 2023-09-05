import 'package:flutter/cupertino.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/helpers/show_toast.dart';

import '../models/bookmark.dart';

class BookmarkHelper {
  static const String _bookmarkKey = 'bookmarkList';

  // Add a bookmark to the list
  static void addBookmark(Bookmark bookmark, BuildContext context) {
    final List<String> bookmarkList = AppPreferences.getStringList(_bookmarkKey) ?? [];
    final String newBookmark = '${bookmark.suraNumber}:${bookmark.verseNumber}';

    if (!bookmarkList.contains(newBookmark)) {
      bookmarkList.add(newBookmark);
      AppPreferences.setStringList(_bookmarkKey, bookmarkList);
    }

    ShowToast.showToast(context, 'Bookmark added successfully!');
  }


  // Delete a bookmark from the list
  static void deleteBookmark(Bookmark bookmark, BuildContext context) {
    final List<String>? bookmarkList = AppPreferences.getStringList(_bookmarkKey);

    if (bookmarkList != null) {
      bookmarkList.remove('${bookmark.suraNumber}:${bookmark.verseNumber}');
     AppPreferences.setStringList(_bookmarkKey, bookmarkList);
    }
    ShowToast.showToast(context, 'Bookmark deleted successfully!');
  }

  // Get the list of bookmarks
  static List<Bookmark> getBookmarkList() {
   final List<String> bookmarkList = AppPreferences.getStringList(_bookmarkKey) ?? [];

    return bookmarkList.map((bookmarkString) {
      final parts = bookmarkString.split(':');
      return Bookmark(suraNumber: parts[0], verseNumber: parts[1]);
    }).toList();
  }
}
