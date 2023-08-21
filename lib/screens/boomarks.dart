import 'package:flutter/material.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/bookmark_helper.dart';
import 'package:tamil_quran/models/bookmark.dart';

class QuranBookmarkScreen extends StatefulWidget {
  const QuranBookmarkScreen({super.key});

  @override
  State<QuranBookmarkScreen> createState() => _QuranBookmarkScreenState();
}

class _QuranBookmarkScreenState extends State<QuranBookmarkScreen> {
  bool loadingBookmarks = false;
  List<Bookmark> bookmarkList = [];

  @override
  void initState() {
    super.initState();
    getBookmarks();
  }

  getBookmarks() async {
    // loadingBookmarks = true;
    bookmarkList = await BookmarkHelper.getBookmarkList();
    setState(() {});
    print(bookmarkList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      body: ListView.builder(
        itemCount: bookmarkList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.bookmark),
            ),
            title: Text(bookmarkList[index].key),
            subtitle: Text(bookmarkList[index].value),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                BookmarkHelper.deleteBookmark(Bookmark(
                    key: bookmarkList[index].key,
                    value: bookmarkList[index].value));
                getBookmarks();
              },
            ),
          );
        },
      ),
    );
  }
}
