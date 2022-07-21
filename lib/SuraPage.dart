import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';

class SuraPage extends StatefulWidget {
  final int SuraNumber;
  final String SuraName;

  const SuraPage({Key? key, required this.SuraNumber, required this.SuraName})
      : super(key: key);

  @override
  State<SuraPage> createState() => _SuraPageState();
}

List _quranDb = [];
List _QuranArabic = [];
int VerseNumber = 0;
String CopiedVerse = '';

class _SuraPageState extends State<SuraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: Text(
            widget.SuraName,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              _quranDb.isNotEmpty && _QuranArabic.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount:
                              widget.SuraNumber == 0 || widget.SuraNumber == 8
                                  ? int.parse(
                                      _quranDb[widget.SuraNumber]["versecount"])
                                  : int.parse(_quranDb[widget.SuraNumber]
                                          ["versecount"]) +
                                      1,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text(
                                  setArabicVerse(index),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'AlQalam',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                subtitle: Text(
                                  setTamilVerse(index),
                                  style: const TextStyle(
                                    fontFamily: 'MeeraInimai',
                                    fontSize: 19,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {},
                                onLongPress: () {

                                  Share.share('${setArabicVerse(index)}\n\n${setTamilVerse(index)}\n\n(திருக்குர்ஆன் ${widget.SuraNumber + 1}:${VerseNumber})'
                                      '\n\n\n( Get Tamil Quran Android App: https://bit.ly/TamilQuran )');

                                },
                              ),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ));
  }

  Future<void> readTamilSura() async {
    final String response =
        await rootBundle.loadString('assets/quran_tamil.json');
    final data = await json.decode(response);
    setState(
      () {
        _quranDb = data["sura"];
      },
    );
  }

  Future<void> readArabicSura() async {
    final String response =
        await rootBundle.loadString('assets/quran_arabic.json');
    final data = await json.decode(response);
    setState(
      () {
        _QuranArabic = data["sura"];
      },
    );
  }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }

  String setArabicVerse(index) {
    if (widget.SuraNumber == 0 || widget.SuraNumber == 8) {
      VerseNumber = index + 1;
      return '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}';
    }
    VerseNumber = index;
    return index == 0
        ? '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}'
        : '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}';
  }

  String setTamilVerse(index) {
    if (widget.SuraNumber == 0 || widget.SuraNumber == 8) {
      VerseNumber = index + 1;
      return '${index + 1}. ${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}';
    }
    VerseNumber = index;
    return index == 0
        ? '${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}'
        : '${index}. ${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}';
  }

  @override
  void initState() {
    super.initState();
    readTamilSura();
    readArabicSura();
  }
}
