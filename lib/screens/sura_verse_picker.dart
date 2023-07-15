import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sura_list.dart';
import '../providers/quran_provider.dart';

class SuraVersePickerScreen extends StatefulWidget {
  const SuraVersePickerScreen({super.key});

  @override
  State<SuraVersePickerScreen> createState() => _SuraVersePickerScreenState();
}

class _SuraVersePickerScreenState extends State<SuraVersePickerScreen> {
  late final quranProvider = context.read<QuranProvider>();

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
              children: quranProvider.suraList
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
              children: List.generate(
                  quranProvider.suraList[selectedSura - 1].verseCount,
                  (index) => Center(child: Text('${index + 1}'))),
            ),
          ),
        ],
      ),
    );
  }
}
