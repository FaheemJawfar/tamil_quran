import 'package:flutter/material.dart';
import '../app_texts/app_helpers_texts.dart';
import '../utils/shared_preferences.dart';
import '../common_widgets/show_toast.dart';
import 'bookmark.dart';

class BookmarkHelper {
  static const String _bookmarkKey = 'bookmarkList';

  // Add a bookmark to the list
  static void addBookmark(Bookmark bookmark, BuildContext context) {
    final List<String> bookmarkList =
        AppPreferences.getStringList(_bookmarkKey) ?? [];
    final String newBookmark = '${bookmark.suraNumber}:${bookmark.verseNumber}';

    if (!bookmarkList.contains(newBookmark)) {
      bookmarkList.add(newBookmark);
      AppPreferences.setStringList(_bookmarkKey, bookmarkList);
    }

    ShowToast.showToast(context, AppHelpersTexts.bookmarkAdded);
  }

  // Delete a bookmark from the list
  static void deleteBookmark(Bookmark bookmark, BuildContext context) {
    final List<String>? bookmarkList =
        AppPreferences.getStringList(_bookmarkKey);

    if (bookmarkList != null) {
      bookmarkList.remove('${bookmark.suraNumber}:${bookmark.verseNumber}');
      AppPreferences.setStringList(_bookmarkKey, bookmarkList);
    }
    ShowToast.showToast(context, AppHelpersTexts.bookmarkDeleted);
  }

  // Get the list of bookmarks
  static List<Bookmark> getBookmarkList() {
    final List<String> bookmarkList =
        AppPreferences.getStringList(_bookmarkKey) ?? [];

    return bookmarkList.map((bookmarkString) {
      final parts = bookmarkString.split(':');
      return Bookmark(suraNumber: parts[0], verseNumber: parts[1]);
    }).toList();
  }
}
