import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/search_quran.dart';
import 'package:tamil_quran/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_us.dart';
import 'read_sura.dart';

class SuraNames extends StatefulWidget {
  const SuraNames({Key? key}) : super(key: key);

  @override
  State<SuraNames> createState() => _SuraNamesState();
}

class _SuraNamesState extends State<SuraNames> {
  List _SuraList = [];
  int InputSura = 0;
  int InputVerse = 0;

  double _currentArabicFontSize = 22;
  double _currentTamilFontSize = 18;
  String _selectedTamilFont = 'MuktaMalar';
  String _selectedArabicFont = 'AlQalam';
  bool NightMode = false;
  int _lastSura = 0;
  int _lastVerse = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NightMode ? Colors.grey[900] : Colors.white,
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  _lastSura = (prefs.getInt('lastSura') ?? 0);
                  _lastVerse = (prefs.getInt('lastVerse') ?? 0);

                  if (_lastSura != 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReadSura(
                              SuraNumber: _lastSura,
                              VerseNumber: _lastVerse,
                              SuraName: '${_SuraList[_lastSura - 1]["name"]}',
                            )));
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: NightMode ? Colors.white : Colors.green),
                ),
                child: Text(
                  'வாசிப்பைத் தொடர்க...',
                  style: TextStyle(
                    color: NightMode ? Colors.white : Colors.green[900],
                    fontFamily: _selectedTamilFont,
                    fontSize: 16,
                  ),
                ),
              ),
              _SuraList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: _SuraList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color:
                                  NightMode ? Colors.grey[900] : Colors.white,
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${index + 1}. ${_SuraList[index]["name"]}',
                                      style: TextStyle(
                                          color: NightMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: _currentTamilFontSize,
                                          fontFamily: _selectedTamilFont,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'வசனங்கள் : ${_SuraList[index]["versecnt"]}',
                                          style: TextStyle(
                                              color: NightMode
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 15,
                                              fontFamily: _selectedTamilFont,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${_SuraList[index]["name_arabic"]}',
                                          style: TextStyle(
                                              color: NightMode
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: _currentArabicFontSize,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: _selectedArabicFont),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuraPage(selectedSura : index)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ReadSura(
                                            SuraNumber: _SuraList[index]
                                                ["surano"],
                                            SuraName:
                                                '${_SuraList[index]["name"]}',
                                            VerseNumber: 0,
                                          )));
                                },
                              ),
                            );
                          }),
                    )
                  : const Expanded(
                      child: Center(
                        child: SpinKitRing(
                          color: Colors.green,
                          size: 50.0,
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }

  Future<void> getSuraList() async {
    final String response =
        await rootBundle.loadString('assets/sura_names.json');
    final data = await json.decode(response);
    setState(() {
      _SuraList = data["data"];
    });
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: NightMode ? Colors.black : Colors.green[900],
      //centerTitle: true,
      title: Text('அத்தியாயங்கள்'),
      automaticallyImplyLeading: false,

      actions: [

        IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchQuran()),
          );

        }, icon: Icon(Icons.search)),


        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            ).then((value) => setState(() {
                  loadSelections();
                }));
          },
        ),
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
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
            // PopupMenuItem 1
            PopupMenuItem(
              value: 2,
              // row with 2 children
              child: Row(
                children: const [
                  Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Share This App")
                ],
              ),
            ),

            PopupMenuItem(
              value: 3,
              // row with 2 children
              child: Row(
                children: const [
                  Icon(
                    Icons.star_rate_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Rate This App")
                ],
              ),
            ),

            // PopupMenuItem 2
            PopupMenuItem(
              value: 4,
              // row with two children
              child: Row(
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("About Us")
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
                              InputSura = int.parse(value);
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                hintText: "அத்தியாயத்தை உள்ளிடுக",
                                label: Text("அத்தியாயம்")),
                          ),
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
                                        SuraNumber: InputSura,
                                        VerseNumber: InputVerse,
                                        SuraName:
                                            '${_SuraList[InputSura - 1]["name"]}',
                                      ))),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (value == 2) {
              Share.share(
                  'திருக்குர்ஆன் தமிழாக்கத்தை உங்கள் Android கைபேசியில் வாசிக்க இந்த இணைப்பில் சென்று பதிவிறக்கம் செய்யுங்கள்  : https://bit.ly/TamilQuran');
            } else if (value == 3) {
              _launchURL(
                  'https://play.google.com/store/apps/details?id=com.faheemapps.tamil_quran');
            } else if (value == 4) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUs()));
            }
          },
        ),
      ],
    );
  }

  void searchQuran() {}

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void loadSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentTamilFontSize = (prefs.getDouble('tamilFontSize') ?? 18);
      _currentArabicFontSize = (prefs.getDouble('arabicFontSize') ?? 22);
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
      _selectedArabicFont =
          (prefs.getString('selectedArabicFont') ?? 'AlQalam');
      NightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    getSuraList();
    loadSelections();
  }
}
