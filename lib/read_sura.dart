import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';

class ReadSura extends StatefulWidget {
  final int SuraNumber;
  final String SuraName;
  final int VerseCount;

  const ReadSura({Key? key, required this.SuraNumber, required this.SuraName, required this.VerseCount})
      : super(key: key);

  @override
  State<ReadSura> createState() => _ReadSuraState();
}

List _quranDb = [];
int VerseNumber = 0;
String CopiedVerse = '';

class _ReadSuraState extends State<ReadSura> {
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
              _quranDb.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount:
                             widget.VerseCount,
                              // widget.SuraNumber == 0 || widget.SuraNumber == 8
                              //     ? int.parse(
                              //         _quranDb[widget.SuraNumber]["versecount"])
                              //     : int.parse(_quranDb[widget.SuraNumber]
                              //             ["versecount"]) +
                              //         1,
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

                                  // Share.share('${setArabicVerse(index)}\n\n${setTamilVerse(index)}\n\n(திருக்குர்ஆன் ${widget.SuraNumber + 1}:${VerseNumber})'
                                  //     '\n\n\n( Get Tamil Quran Android App: https://bit.ly/TamilQuran )');

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

  Future<void> readQuranDb() async {
    final String response =
        await rootBundle.loadString('assets/alquran-db.json');
    final data = await json.decode(response);
    setState(
      () {
        _quranDb = data["data"];
      },
    );
  }

  // Future<void> readArabicSura() async {
  //   final String response =
  //       await rootBundle.loadString('assets/quran_arabic.json');
  //   final data = await json.decode(response);
  //   setState(
  //     () {
  //       _QuranArabic = data["sura"];
  //     },
  //   );
  // }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }

  String setArabicVerse(index) {

    //return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["arabic"]}';
    return '${_quranDb[0]["sura${widget.SuraNumber+1}"][index]["arabic"]}';

    // if (widget.SuraNumber == 0 || widget.SuraNumber == 8) {
    //   VerseNumber = index + 1;
    //   return '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}';
    // }
    // VerseNumber = index;
    // return index == 0
    //     ? '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}'
    //     : '${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}';
  }

  String setTamilVerse(index) {
    return '${_quranDb[0]["sura${widget.SuraNumber+1}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.SuraNumber+1}"][index]["mJohn"]}';
    //
    // if (widget.SuraNumber == 0 || widget.SuraNumber == 8) {
    //   VerseNumber = index + 1;
    //   return '${index + 1}. ${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}';
    // }
    // VerseNumber = index;
    // return index == 0
    //     ? '${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}'
    //     : '${index}. ${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}';
  }

  @override
  void initState() {
    super.initState();
    readQuranDb();
  }
}
