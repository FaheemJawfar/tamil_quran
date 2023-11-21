import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/home_texts.dart';
import '../read_quran/quran_aya.dart';
import '../read_quran/sura_details.dart';
import '../read_quran/sura_translation_screen.dart';
import '../app_config/color_config.dart';
import '../providers/quran_provider.dart';

class SuraVersePickerScreen extends StatefulWidget {
  const SuraVersePickerScreen({super.key});

  @override
  State<SuraVersePickerScreen> createState() => _SuraVersePickerScreenState();
}

class _SuraVersePickerScreenState extends State<SuraVersePickerScreen> {
  late final quranProvider = context.read<QuranProvider>();

  int selectedSura = 1;
  int selectedAyaNumber = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: Text(
          HomeTexts.goToVerseHeader,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      content: Container(
          height: 400,
          width: double.infinity,
          color: quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomCupertinoPicker(
                  highlighterBorder: Border(
                    top: BorderSide(
                      width: 2.0,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : Colors.green,
                    ),
                    bottom: BorderSide(
                      width: 2.0,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : Colors.green,
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

                      if (selectedAyaNumber > SuraDetails.suraListAll[selectedSura - 1].verseCount) {
                        selectedAyaNumber = SuraDetails.suraListAll[selectedSura - 1].verseCount;
                      }
                    });
                  },
                  children: SuraDetails.suraListAll
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
                  highlighterBorder: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : Colors.green,
                    ),
                    bottom: BorderSide(
                      width: 1.0,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : Colors.green,
                    ),
                  ),
                  highlighterBorderWidth: 60,
                  scrollPhysics: const FixedExtentScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemExtent: 40,
                  onSelectedItemChanged: (value) {
                    selectedAyaNumber = value + 1;
                  },
                  children: List.generate(
                      SuraDetails.suraListAll[selectedSura - 1].verseCount,
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
          quranProvider.selectedSuraNumber = selectedSura;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SuraTranslationScreen(
                        goToVerse: findAyaIndex(selectedSura, selectedAyaNumber),
                      )));
        })
      ],
    );
  }

  Widget showVersePickupButton(String label, void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: quranProvider.isDarkMode
          ? ColorConfig.darkModeButtonStyle
          : ElevatedButton.styleFrom(
              backgroundColor: ColorConfig.backgroundColor,
            ),
      child: Text(
        label,
        style: TextStyle(
          color: quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  int findAyaIndex(int selectedSura, int selectedAyaNumber){
    List<QuranAya> allAyasInSura = quranProvider.allSurasTamil[selectedSura-1].listOfAyas;

    int ayaIndex = allAyasInSura.indexWhere(
            (element) => element.ayaNumberList.contains(selectedAyaNumber.toString()));

    return ayaIndex + 1;
  }
}
