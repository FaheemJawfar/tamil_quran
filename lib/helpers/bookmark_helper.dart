import 'package:shared_preferences/shared_preferences.dart';

import '../models/bookmark.dart';

class BookmarkHelper {
  static const String _bookmarkKey = 'bookmarkList';

  // Add a bookmark to the list
  static Future<void> addBookmark(Bookmark bookmark) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkList = prefs.getStringList(_bookmarkKey) ?? [];

    bookmarkList.add('${bookmark.key}:${bookmark.value}');
    await prefs.setStringList(_bookmarkKey, bookmarkList);
  }

  // Delete a bookmark from the list
  static Future<void> deleteBookmark(Bookmark bookmark) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? bookmarkList = prefs.getStringList(_bookmarkKey);

    if (bookmarkList != null) {
      bookmarkList.remove('${bookmark.key}:${bookmark.value}');
      await prefs.setStringList(_bookmarkKey, bookmarkList);
    }
  }

  // Get the list of bookmarks
  static Future<List<Bookmark>> getBookmarkList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkList = prefs.getStringList(_bookmarkKey) ?? [];

    return bookmarkList.map((bookmarkString) {
      final parts = bookmarkString.split(':');
      return Bookmark(key: parts[0], value: parts[1]);
    }).toList();
  }
}
