import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../models/sura_list.dart';

class SuraVersePickerScreen extends StatefulWidget {
  const SuraVersePickerScreen({super.key});

  @override
  State<SuraVersePickerScreen> createState() => _SuraVersePickerScreenState();
}

class _SuraVersePickerScreenState extends State<SuraVersePickerScreen> {
  List<SuraList> suras = QuranData.suras;
  int selectedSura = 1;
  int selectedVerse = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomCupertinoPicker(
              highlighterBorder: const Border(
                top: BorderSide(
                  width: 2.0,
                  color: Colors.green,
                ),
                bottom: BorderSide(
                  width: 2.0,
                  color: Colors.green,
                ),
              ),
              highlighterBorderWidth: 60,
              scrollPhysics: const FixedExtentScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemExtent: 40,
              onSelectedItemChanged: (value) {
                selectedSura = value + 1;
                setState(() {});
                print('selected sura: $selectedSura');
              },
              children: suras
                  .map(
                    (sura) => Center(
                        child: Text(
                      '${sura.suraNumber}. ${sura.tamilName}',
                      style: const TextStyle(fontSize: 18),
                    )),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: CustomCupertinoPicker(
              highlighterBorder: const Border(
                top: BorderSide(
                  width: 1.0,
                  color: Colors.green,
                ),
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.green,
                ),
              ),
              highlighterBorderWidth: 60,
              scrollPhysics: const FixedExtentScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemExtent: 40,
              onSelectedItemChanged: (value) {
                selectedVerse = value + 1;
                print('selected verse: $selectedVerse');
              },
              children: List.generate(suras[selectedSura - 1].verseCount,
                  (index) => Center(child: Text('${index + 1}'))),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.fromLTRB(25, 100, 25, 100),
    //   child: Scaffold(
    //     body: Padding(
    //       padding: const EdgeInsets.only(top: 20, bottom: 20),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             flex: 8,
    //             child: ListView.builder(
    //               itemCount: suras.length,
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                   title: Text(
    //                       '${suras[index].suraNumber}. ${suras[index].tamilName}'),
    //                   selected: selectedSuraIndex == index,
    //                   onTap: () {
    //                     setState(() {
    //                       selectedSuraIndex = index;
    //                     });
    //                   },
    //                 );
    //               },
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: ListView.builder(
    //               itemCount: suras[selectedSuraIndex].verseCount,
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                   title: Text((index + 1).toString()),
    //                   selected: selectedVerseIndex == index,
    //                   onTap: () {
    //                     setState(() {
    //                       selectedVerseIndex = index;
    //                     });
    //                   },
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar: Container(
    //       padding: const EdgeInsets.all(16),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child:
    //                 TextButton(onPressed: () {}, child: const Text('Cancel')),
    //           ),
    //           Expanded(
    //             child: ElevatedButton(
    //               onPressed: () {
    //                 int selectedSura = suras[selectedSuraIndex].suraNumber;
    //                 int selectedVerse = selectedVerseIndex + 1;
    //                 String suraName = suras[selectedSuraIndex].tamilName;
    //
    //                 Navigator.pushReplacement(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => ReadSuraScreen(
    //                       selectedSura: selectedSura,
    //                       //suraName: suraName,
    //                       scrollTo: selectedVerse,
    //                     ),
    //                   ),
    //                 );
    //               },
    //               child: const Text('Pick'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
