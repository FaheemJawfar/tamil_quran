import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/screens/read_sura_translation.dart';
import '../config/color_config.dart';
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
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: ColorConfig.primaryColor,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: Text(
          'வசனத்திற்குச் செல்க...',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      content: Container(
          height: 400,
          width: double.infinity,
          color: ColorConfig.backgroundColor,
          child: Row(
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
                    setState(() {
                      selectedSura = value + 1;
                    });
                  },
                  children: quranProvider.suraList
                      .map(
                        (sura) => Center(
                            child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            '${sura.suraNumber}. ${sura.tamilName}',
                            style: const TextStyle(fontSize: 16),
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
                    selectedVerse = value + 1;
                  },
                  children: List.generate(
                      quranProvider.suraList[selectedSura - 1].verseCount,
                      (index) => Center(child: Text('${index + 1}'))),
                ),
              ),
            ],
          )),
      actions: [
        showVersePickupButton('Cancel', () {
          Navigator.of(context).pop();
        }),
        showVersePickupButton('OK', () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadSuraTranslation(
                        selectedSura: selectedSura,
                        scrollTo: selectedVerse,
                      )));
        })
      ],
    );
  }

  Widget showVersePickupButton(String label, void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConfig.backgroundColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: ColorConfig.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
