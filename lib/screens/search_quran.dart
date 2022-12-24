import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchQuran extends StatefulWidget {
  const SearchQuran({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchQuran> createState() => _SearchQuranState();
}

class _SearchQuranState extends State<SearchQuran> {
  TextEditingController editingController = TextEditingController();

  List _quranDb = [];
  List _quranArabic = [];
  List _pjQuranDb = [];
  String shareVerse = '';
  String _selectedTranslation = 'mJohn';
  double _currentArabicFontSize = 20;
  double _currentTamilFontSize = 20;
  String _selectedTamilFont = 'MuktaMalar';
  String _selectedArabicFont = 'AlQalam';
  bool nightMode = false;
  int inputVerse = 0;
  List searchData = [];
  List tempSearchData = [];

  onSearchTextChanged(String query) async {
    tempSearchData.clear();
    if (query.isEmpty) {
      // Check textfield is empty or not
      setState(() {});
      return;
    }

    for (var data in searchData) {
      if (data.toString().contains(query.toString())) {
        tempSearchData.add(
            data); // If not empty then add search data into search data list
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: nightMode ? Colors.black : Colors.green[900],
        title: const Text(
          'திருக்குர்ஆனில் தேடுக',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                onSearchTextChanged(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                labelText: "தேடுக",
                labelStyle: TextStyle(
                  color: nightMode ? Colors.white70 : Colors.grey[600],
                ),
                hintText: "வார்த்தையை உள்ளிடுக",
                hintStyle: TextStyle(
                  color: nightMode ? Colors.white70 : Colors.grey[600],
                ),
                prefixIcon: Icon(Icons.search,
                    color: nightMode ? Colors.white : Colors.black),
                //prefixIconColor: NightMode ? Colors.white : Colors.black,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: nightMode ? Colors.white : Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(25.0))),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: nightMode ? Colors.white : Colors.green,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              cursorColor: nightMode ? Colors.white : Colors.black,
              style: TextStyle(
                color: nightMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          tempSearchData.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: tempSearchData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: nightMode ? Colors.grey[900] : Colors.white,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: ListTile(
                          title: Text(
                            tempSearchData.elementAt(index),
                            style: TextStyle(
                              color: nightMode ? Colors.white : Colors.black,
                              fontFamily: _selectedTamilFont,
                              fontSize: _currentTamilFontSize,
                            ),
                          ),
                          onLongPress: () {
                            Share.share(tempSearchData.elementAt(index));
                          },
                        ),
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future<void> readQuranArabic() async {
    final String response =
        await rootBundle.loadString('assets/quran_arabic.json');
    final data = await json.decode(response);
    setState(
      () {
        _quranArabic = data["quran"];
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

  loadSearchData() async {
    await loadSelections();

    if (_selectedTranslation == 'pj') {
      final String response =
          await rootBundle.loadString('assets/quran-pj.json');
      final data = await json.decode(response);
      setState(
        () {
          _pjQuranDb = data["data"];
        },
      );

      int sura = 1;
      int verse = 0;

      for (sura; sura <= 114; sura++) {
        for (verse; verse < _pjQuranDb[0]["sura$sura"].length; verse++) {
          setState(() {
            searchData
                .add('$sura:${_pjQuranDb[0]["sura$sura"][verse]["tamil"]}');
          });
        }
        verse = 0;
      }
    } else {
      final String response =
          await rootBundle.loadString('assets/alquran-db.json');
      final data = await json.decode(response);
      setState(
        () {
          _quranDb = data["data"];
        },
      );

      int sura = 1;
      int verse = 0;

      for (sura; sura <= 114; sura++) {
        for (verse; verse < _quranDb[0]["sura$sura"].length; verse++) {
          setState(() {
            searchData.add(
                '${_quranDb[0]["sura$sura"][verse][_selectedTranslation]} \n(திருக்குர்ஆன் $sura:$verse)');
          });
        }
        verse = 0;
      }
    }
  }

  loadSelections() async {
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
      nightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    //items.addAll(duplicateItems);
    loadSelections();
    // readQuranDb();
    readQuranArabic();
    readPJQuranDb();
    loadSearchData();

    super.initState();
  }
}
