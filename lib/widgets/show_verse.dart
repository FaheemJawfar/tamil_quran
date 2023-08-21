import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/helpers/bookmark_helper.dart';
import 'package:tamil_quran/helpers/verse_options.dart';
import 'package:tamil_quran/models/bookmark.dart';
import 'package:tamil_quran/models/verse.dart';

class ShowVerse extends StatefulWidget {
  final VerseModel verseModel;

  const ShowVerse({required this.verseModel, Key? key}) : super(key: key);

  @override
  State<ShowVerse> createState() => _ShowVerseState();
}

class _ShowVerseState extends State<ShowVerse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.verseModel.aya}. ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                color: Colors.green.shade100,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'copy',
                    child: getPopupMenuItem(Icons.copy, 'Copy verse'),
                  ),
                  PopupMenuItem<String>(
                    value: 'share',
                    child: getPopupMenuItem(Icons.share, 'Share verse'),
                  ),
                  PopupMenuItem<String>(
                    value: 'bookmark',
                    child: getPopupMenuItem(
                        Icons.bookmark_add_outlined, 'Add to Bookmark'),
                  ),
                ],
                onSelected: (String value) {
                  switch (value) {
                    case 'copy':
                      VerseOptions.copyToClipboard(
                          getVerseCopy(widget.verseModel));
                      break;
                    case 'share':
                      VerseOptions.shareVerse(getVerseCopy(widget.verseModel));
                      break;
                    case 'bookmark':
                      BookmarkHelper.addBookmark(Bookmark(
                          key: widget.verseModel.sura.toString(),
                          value: widget.verseModel.aya.toString()));
                      break;
                  }
                },
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
                child: Text(
                  '${widget.verseModel.arabic}${getVerseEndSymbol(widget.verseModel.aya)}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.verseModel.mJohn,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: Colors.green.shade700,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  getVerseCopy(VerseModel selectedVerse) {
    String verseCopy =
        '${selectedVerse.arabic}\n\n${selectedVerse.mJohn}\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})';
    // print(verseCopy);
    return verseCopy;
  }
}
