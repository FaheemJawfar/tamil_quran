import 'package:flutter/material.dart';
import 'package:tamil_quran/screens/read_sura.dart';

import '../models/sura_list.dart';

class SuraVersePickerScreen extends StatefulWidget {
  @override
  _SuraVersePickerScreenState createState() => _SuraVersePickerScreenState();
}

class _SuraVersePickerScreenState extends State<SuraVersePickerScreen> {
  List<SuraList> suras = QuranData.suras;
  int selectedSuraIndex = 0;
  int selectedVerseIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 100, 25, 100),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: suras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${suras[index].suraNumber}. ${suras[index].tamilName}'),
                      selected: selectedSuraIndex == index,
                      onTap: () {
                        setState(() {
                          selectedSuraIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: suras[selectedSuraIndex].verseCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text((index + 1).toString()),
                      selected: selectedVerseIndex == index,
                      onTap: () {
                        setState(() {
                          selectedVerseIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextButton(onPressed: () {}, child: Text('Cancel')),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    int selectedSura = suras[selectedSuraIndex].suraNumber;
                    int selectedVerse = selectedVerseIndex + 1;
                    String suraName = suras[selectedSuraIndex].tamilName;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadSuraScreen(
                          selectedSura: selectedSura,
                          suraName: suraName,
                          scrollTo: selectedVerse,
                        ),
                      ),
                    );
                  },
                  child: Text('Pick'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
