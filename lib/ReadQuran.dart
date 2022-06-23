import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'AboutUs.dart';
import 'GoToVerse.dart';
import 'SuraPage.dart';

class ReadQuran extends StatefulWidget {
  const ReadQuran({Key? key}) : super(key: key);

  @override
  State<ReadQuran> createState() => _ReadQuranState();
}

class _ReadQuranState extends State<ReadQuran> {
  List _quranDb = [];
  int InputSura = 0;
  int InputVerse = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          centerTitle: true,
          title: Text('அத்தியாயங்கள்'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'வசனத்திற்கு செல்க', 'About Us'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _quranDb.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: _quranDb.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                              child: ListTile(
                                title: Text(
                                  '${_quranDb[index]["tamilname"]}',
                                  style: TextStyle(
                                      fontFamily: 'MeeraInimai',
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${_quranDb[index]["-name"]}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuraPage(selectedSura : index)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SuraPage(
                                          SuraNumber: index,
                                          SuraName:
                                              '${_quranDb[index]["tamilname"]}')));
                                },
                              ),
                            );
                          }),
                    )
                  : Container(
                      child: Expanded(
                      child: Center(
                        child: SpinKitRing(
                          color: Colors.green,
                          size: 50.0,
                        ),
                      ),
                    )),
            ],
          ),
        ));
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/quran_tamil.json');
    final data = await json.decode(response);
    setState(() {
      //_prayerTimes = data["prayer_times"];
      _quranDb = data['sura'];
    });
  }

  void handleClick(String value) {
    switch (value) {
      case 'வசனத்திற்கு செல்க':
        //print('Hello');
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('வசனத்திற்குச் செல்க'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    InputSura = int.parse(value) - 1;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                      hintText: "அத்தியாயத்தை உள்ளிடுக",
                      label: Text("அத்தியாயம்")),
                ),
                TextField(
                  onChanged: (value) {
                    InputVerse = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GoToVerse(
                        SuraNumber: InputSura, VerseNumber: InputVerse))),
                child: const Text('OK'),
              ),
            ],
          ),
        );

        break;

      case 'About Us':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUs()));

        break;
    }
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }
}
