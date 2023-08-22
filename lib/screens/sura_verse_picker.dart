import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quran_provider.dart';

class SuraVersePickerScreen extends StatefulWidget {
  const SuraVersePickerScreen({super.key});

  @override
  State<SuraVersePickerScreen> createState() => _SuraVersePickerScreenState();
}

class _SuraVersePickerScreenState extends State<SuraVersePickerScreen> {
  late final quranProvider = context.watch<QuranProvider>();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
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
              quranProvider.pickedSura = value + 1;
            },
            children: quranProvider.suraList
                .map(
                  (sura) => Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '${sura.suraNumber}. ${sura.tamilName}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
            )
                .toList(),
          ),
        ),
        Expanded(
          flex: 1,
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
              quranProvider.pickedVerse = value + 1;

            },
            children: List.generate(
                quranProvider.suraList[quranProvider.pickedSura - 1].verseCount,
                    (index) => Center(child: Text('${index + 1}'))),
          ),
        ),
      ],
    );
  }
}
