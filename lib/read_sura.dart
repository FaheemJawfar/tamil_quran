import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/settings.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReadSura extends StatefulWidget {
  final int SuraNumber;
  final String SuraName;
  final int VerseNumber;

  const ReadSura({
    Key? key,
    required this.SuraNumber,
    required this.SuraName,
    required this.VerseNumber,
  }) : super(key: key);

  @override
  State<ReadSura> createState() => _ReadSuraState();
}

List _quranDb = [];
List _pjQuranDb = [];
String ShareVerse = '';
String _selectedTranslation = 'mJohn';
double _currentArabicFontSize = 20;
double _currentTamilFontSize = 20;
String _selectedTamilFont = 'MuktaMalar';
String _selectedArabicFont = 'AlQalam';
bool NightMode = false;
int InputVerse = 0;

class _ReadSuraState extends State<ReadSura> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NightMode ? Colors.grey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            _quranDb.isNotEmpty && _pjQuranDb.isNotEmpty
                ? Expanded(
                    child: ScrollablePositionedList.builder(
                        initialScrollIndex: widget.VerseNumber,
                        itemScrollController: _itemScrollController,
                        itemCount: _selectedTranslation == 'pj'
                            ? _pjQuranDb[0]["sura${widget.SuraNumber}"].length
                            : _quranDb[0]["sura${widget.SuraNumber}"].length,
                        itemBuilder: (context, index) {
                          return VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (info) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              prefs.setInt('lastVerse', index);
                              prefs.setInt('lastSura', widget.SuraNumber);
                            },
                            child: Card(
                              color:
                                  NightMode ? Colors.grey[900] : Colors.white,
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text(
                                  _selectedTranslation == 'pj'
                                      ? setPJArabicVerse(index)
                                      : setArabicVerse(index),
                                  style: TextStyle(
                                    color:
                                        NightMode ? Colors.white : Colors.black,
                                    fontSize: _currentArabicFontSize,
                                    fontFamily: _selectedArabicFont,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                subtitle: Text(
                                  _selectedTranslation == 'pj'
                                      ? setPJTamilVerse(index)
                                      : setTamilVerse(index),
                                  style: TextStyle(
                                    color:
                                        NightMode ? Colors.white : Colors.black,
                                    fontFamily: _selectedTamilFont,
                                    fontSize: _currentTamilFontSize,
                                  ),
                                ),
                                onTap: () {},
                                onLongPress: () {
                                  _selectedTranslation == 'pj'
                                      ? Share.share(
                                          '${setPJArabicVerse(index)}\n\n${setPJTamilVerse(index)}\n\n(திருக்குர்ஆன் ${widget.SuraNumber}:${_pjQuranDb[0]["sura${widget.SuraNumber}"][index]["verse_id"]})'
                                          '\n\n\n( Get Tamil Quran Android App: https://bit.ly/TamilQuran )')
                                      : Share.share(
                                          '${setArabicVerse(index)}\n\n${setTamilVerse(index)}\n\n(திருக்குர்ஆன் ${widget.SuraNumber}:${_quranDb[0]["sura${widget.SuraNumber}"][index]["ayah"]})'
                                          '\n\n\n( Get Tamil Quran Android App: https://bit.ly/TamilQuran )');
                                },
                              ),
                            ),
                          );
                        }),
                  )
                : Container(),
          ],
        ),
      ),
    );
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

  Future<void> readPJQuranDb() async {
    final String response = await rootBundle.loadString('assets/quran-pj.json');
    final data = await json.decode(response);
    setState(
      () {
        _pjQuranDb = data["data"];
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
    if (widget.SuraNumber == 1 || widget.SuraNumber == 9) {
      return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
    } else {
      if (index == 0) {
        return '${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
      } else {
        return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.SuraNumber}"][index][_selectedTranslation]}';
      }
    }
  }

  String setPJArabicVerse(index) {
    return '${_pjQuranDb[0]["sura${widget.SuraNumber}"][index]["arabic"]}';
  }

  String setPJTamilVerse(index) {
    return '${_pjQuranDb[0]["sura${widget.SuraNumber}"][index]["tamil"]}';
  }

  void loadSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTranslation =
          (prefs.getString('selectedTranslation') ?? 'mJohn');
      _currentTamilFontSize = (prefs.getDouble('tamilFontSize') ?? 20);
      _currentArabicFontSize = (prefs.getDouble('arabicFontSize') ?? 24);
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
      _selectedArabicFont =
          (prefs.getString('selectedArabicFont') ?? 'AlQalam');
      NightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: NightMode ? Colors.black : Colors.green[900],
      centerTitle: true,
      title: Text(
        widget.SuraName,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              // row with 2 children
              child: Row(
                children: const [
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("அமைப்புகள்")
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              // row with 2 children
              child: Row(
                children: const [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("வசனத்திற்கு செல்க")
                ],
              ),
            ),
          ],
          offset: Offset(0, 20),
          color: Colors.white,
          elevation: 2,
          // on selected we show the dialog box
          onSelected: (value) {
            if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              ).then((value) => setState(() {
                    loadSelections();
                  }));
            } else if (value == 2) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Center(
                  child: SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text('வசனத்திற்குச் செல்க'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            onChanged: (value) {
                              InputVerse = int.parse(value);
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                hintText: "வசனத்தை உள்ளிடுக", label: Text("வசனம்")),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        OutlinedButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ReadSura(
                                        SuraNumber: widget.SuraNumber,
                                        VerseNumber: InputVerse,
                                        SuraName: widget.SuraName,
                                      ))),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
    readQuranDb();
    readPJQuranDb();
  }
}
