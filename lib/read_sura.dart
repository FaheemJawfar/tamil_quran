import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
String? _selectedTranslation;

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
                              widget.SuraNumber == 1 || widget.SuraNumber == 9 ?
                             widget.VerseCount:
                              widget.VerseCount + 1,


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


  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }

  String setArabicVerse(index) {

    return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["arabic"]}';
  }

  String setTamilVerse(index) {

    if(widget.SuraNumber == 1 || widget.SuraNumber == 9){
      return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
    }
    else {
      if(index == 0){
        return '${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
      }
      else {
        return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
      }

    }


  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTranslation = (prefs.getString('selectedTranslation')?? 'mJohn');
    });
  }

  @override
  void initState() {
    super.initState();
    readQuranDb();
    loadCounter();
  }
}
