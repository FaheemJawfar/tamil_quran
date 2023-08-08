import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/models/verse_model.dart';

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
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ],
                onSelected: (String value) {
                  switch (value) {
                    case 'option1':
                      // Handle option 1 selection
                      break;
                    case 'option2':
                      // Handle option 2 selection
                      break;
                    case 'option3':
                      // Handle option 3 selection
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
}
