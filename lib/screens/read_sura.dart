import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReadSura extends StatefulWidget {
  final int suraNumber;
  final String suraName;
  final int verseNumber;

  const ReadSura({
    Key? key,
    required this.suraNumber,
    required this.suraName,
    required this.verseNumber,
  }) : super(key: key);

  @override
  State<ReadSura> createState() => _ReadSuraState();
}



class _ReadSuraState extends State<ReadSura> {

  late var quranProvider = Provider.of<QuranProvider>(context, listen:true);

  final ItemScrollController _itemScrollController = ItemScrollController();
  // List _quranDb = [];
  // List _quranArabic = [];
  // List _pjQuranDb = [];
  // String shareVerse = '';
  // String _selectedTranslation = 'mJohn';
  double _currentArabicFontSize = 20;
  double _currentTamilFontSize = 20;
  String _selectedTamilFont = 'MuktaMalar';
  String _selectedArabicFont = 'AlQalam';
  bool nightMode = false;
  int inputVerse = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: Text(widget.suraName),
      ),
      body:
      quranProvider.allSuraTamilVerses.isNotEmpty ?
      Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
                       Expanded(
                    child: ScrollablePositionedList.builder(
                        initialScrollIndex: widget.verseNumber,
                        itemScrollController: _itemScrollController,
                        itemCount: quranProvider.allSuraArabicVerses[0].length,

                        itemBuilder: (context, index) {
                          return VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (info) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              prefs.setInt('lastVerse', index);
                              prefs.setInt('lastSura', widget.suraNumber);
                            },
                            child: Card(
                              color:
                                  nightMode ? Colors.grey[900] : Colors.white,
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text(
                                       'Arabic',
                                        style: TextStyle(
                                          color: nightMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: _currentArabicFontSize,
                                          fontFamily: _selectedArabicFont,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),

                                subtitle: Text(
                                          'Tamil Verse',
                                  style: TextStyle(
                                    color:
                                        nightMode ? Colors.white : Colors.black,
                                    fontFamily: _selectedTamilFont,
                                    fontSize: _currentTamilFontSize,
                                  ),
                                ),
                                onTap: () {},
                                onLongPress: () {

                                   },
                              ),
                            ),
                          );
                        }),
                  )
          ],
        ),
      ):Container(),

    );
  }

  // Future<void> readQuranDb() async {
  //   final String response =
  //       await rootBundle.loadString('assets/alquran-db.json');
  //   final data = await json.decode(response);
  //   setState(
  //     () {
  //       _quranDb = data["data"];
  //     },
  //   );
  // }
  //
  // Future<void> readQuranArabic() async {
  //   final String response =
  //   await rootBundle.loadString('assets/quran_arabic.json');
  //   final data = await json.decode(response);
  //   setState(
  //         () {
  //       _quranArabic = data["quran"];
  //     },
  //   );
  // }
  //
  // Future<void> readPJQuranDb() async {
  //   final String response = await rootBundle.loadString('assets/quran-pj.json');
  //   final data = await json.decode(response);
  //   setState(
  //     () {
  //       _pjQuranDb = data["data"];
  //     },
  //   );
  // }
  //
  // String replaceArabicNumber(index) {
  //
  //   if(widget.suraNumber == 1 || widget.suraNumber == 9){
  //     int verse = index+1;
  //     String input = verse.toString();
  //
  //     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  //     const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  //
  //     for (int i = 0; i < english.length; i++) {
  //       input = input.replaceAll(english[i], arabic[i]);
  //     }
  //
  //     return ' $input';
  //   }
  //
  //   else {
  //     String input = index.toString();
  //
  //     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  //     const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  //
  //     for (int i = 0; i < english.length; i++) {
  //       input = input.replaceAll(english[i], arabic[i]);
  //     }
  //
  //     if(index==0){
  //       return '';
  //     }
  //
  //     else {
  //       return ' $input';
  //     }
  //
  //   }
  //
  // }
  //
  // // String setArabicVerse(index) {
  // //   return '${_quranDb[0]["sura${widget.SuraNumber}"][index]["arabic"]}';
  // // }
  //
  // String setArabicVerse(index) {
  //   if(widget.suraNumber == 1 || widget.suraNumber == 9){
  //     return '${_quranArabic[widget.suraNumber-1]["verses"][index]["arabic"]}';
  //   }
  //   else {
  //     if (index==0){
  //       return 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْم';
  //     }
  //
  //     return '${_quranArabic[widget.suraNumber-1]["verses"][index-1]["arabic"]}';
  //   }
  //
  // }
  //
  // String setTamilVerse(index) {
  //   if (widget.suraNumber == 1 || widget.suraNumber == 9) {
  //     return '${_quranDb[0]["sura${widget.suraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.suraNumber}"][index][_selectedTranslation]}';
  //   } else {
  //     if (index == 0) {
  //       return '${_quranDb[0]["sura${widget.suraNumber}"][index][_selectedTranslation]}';
  //     } else {
  //       return '${_quranDb[0]["sura${widget.suraNumber}"][index]["ayah"]}. ${_quranDb[0]["sura${widget.suraNumber}"][index][_selectedTranslation]}';
  //     }
  //   }
  // }
  //
  // String setPJArabicVerse(index) {
  //   return '${_pjQuranDb[0]["sura${widget.suraNumber}"][index]["arabic"]}';
  // }
  //
  // String setPJTamilVerse(index) {
  //   return '${_pjQuranDb[0]["sura${widget.suraNumber}"][index]["tamil"]}';
  // }
  //
  // void loadSelections() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _selectedTranslation =
  //         (prefs.getString('selectedTranslation') ?? 'mJohn');
  //     _currentTamilFontSize = (prefs.getDouble('tamilFontSize') ?? 20);
  //     _currentArabicFontSize = (prefs.getDouble('arabicFontSize') ?? 24);
  //     _selectedTamilFont =
  //         (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
  //     _selectedArabicFont =
  //         (prefs.getString('selectedArabicFont') ?? 'AlQalam');
  //     nightMode = (prefs.getBool('NightMode') ?? false);
  //   });
  // }

  // _buildAppBar() {
  //   return AppBar(
  //     backgroundColor: nightMode ? Colors.black : Colors.green[900],
  //     centerTitle: true,
  //     title: Text(
  //       widget.suraName,
  //       style: const TextStyle(
  //         fontSize: 15,
  //       ),
  //     ),
  //     automaticallyImplyLeading: false,
  //     leading: IconButton(
  //       icon: const Icon(
  //         Icons.arrow_back_ios_new_outlined,
  //       ),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //     actions: [
  //       PopupMenuButton<int>(
  //         itemBuilder: (context) => [
  //           PopupMenuItem(
  //             value: 1,
  //             // row with 2 children
  //             child: Row(
  //               children: const [
  //                 Icon(
  //                   Icons.settings_outlined,
  //                   color: Colors.black,
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text("அமைப்புகள்")
  //               ],
  //             ),
  //           ),
  //           PopupMenuItem(
  //             value: 2,
  //             // row with 2 children
  //             child: Row(
  //               children: const [
  //                 Icon(
  //                   Icons.exit_to_app,
  //                   color: Colors.black,
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text("வசனத்திற்கு செல்க")
  //               ],
  //             ),
  //           ),
  //         ],
  //         offset: const Offset(0, 20),
  //         color: Colors.white,
  //         elevation: 2,
  //         // on selected we show the dialog box
  //         onSelected: (value) {
  //           if (value == 1) {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => const Settings()),
  //             ).then((value) => setState(() {
  //                   loadSelections();
  //                 }));
  //           } else if (value == 2) {
  //             showDialog<String>(
  //               context: context,
  //               builder: (BuildContext context) => Center(
  //                 child: SingleChildScrollView(
  //                   child: AlertDialog(
  //                     title: const Text('வசனத்திற்குச் செல்க'),
  //                     content: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         TextField(
  //                           onChanged: (value) {
  //                             inputVerse = int.parse(value);
  //                           },
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: [
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //                           decoration: const InputDecoration(
  //                               hintText: "வசனத்தை உள்ளிடுக", label: Text("வசனம்")),
  //                         ),
  //                       ],
  //                     ),
  //                     actions: <Widget>[
  //                       OutlinedButton(
  //                         onPressed: () => Navigator.pop(context, 'Cancel'),
  //                         child: const Text('Cancel'),
  //                       ),
  //                       OutlinedButton(
  //                         onPressed: () =>
  //                             Navigator.of(context).push(MaterialPageRoute(
  //                                 builder: (context) => ReadSura(
  //                                       suraNumber: widget.suraNumber,
  //                                       verseNumber: inputVerse,
  //                                       suraName: widget.suraName,
  //                                     ))),
  //                         child: const Text('OK'),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           }
  //         },
  //       ),
  //     ],
  //   );
  // }

  @override
  void initState() {
    super.initState();
  }
}
