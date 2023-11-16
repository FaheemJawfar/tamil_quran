import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/read_quran_texts.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'quran_helper.dart';
import '../common_widgets/show_toast.dart';
import '../app_config/app_config.dart';
import 'quran_aya.dart';
import 'sura_details.dart';

class VerseHelper {
  static Future<void> copyToClipboard(
    String text,
    BuildContext context,
  ) async {
    final clipboardData = ClipboardData(text: text);
    ShowToast.showToast(context, ReadQuranTexts.verseCopied);
    await Clipboard.setData(clipboardData);
  }

  static Future<void> copyText(String text) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
  }

  static String getVerseCopy(
      QuranAya translationAya, String option, BuildContext context) {
    String arabicText = getArabicAyaList(translationAya, context);
    String translationText = getTamilTranslationList(translationAya, context);

    switch (option) {
      case 'copy':
        String verseCopy =
            '$arabicText\n\n$translationText\n\n- (${ReadQuranTexts.holyQuran} ${translationAya.suraIndex}:${translationAya.ayaNumberList})\n\n( ${ReadQuranTexts.getTamilQuran}: ${AppConfig.appShortUrl} )';

        return verseCopy;

      case 'copy_arabic':
        String verseCopy =
            '$arabicText\n\n- (${ReadQuranTexts.holyQuran} ${translationAya.suraIndex}:${translationAya.ayaNumberList})';

        return verseCopy;

      case 'copy_translation':
        String verseCopy =
            '$translationText\n\n- (${ReadQuranTexts.holyQuran} ${translationAya.suraIndex}:${translationAya.ayaNumberList})';
        return verseCopy;

      default:
        return '';
    }
  }

  // static void shareVerse(String verse) {
  //   Share.share(verse);
  // }

  static Future<void> copySura(
    int suraNumber,
    BuildContext context,
  ) async {
    SuraDetails suraDetails = SuraDetails.suraList[suraNumber - 1];
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);

    try {
      StringBuffer suraFullText = StringBuffer();

      String header =
          '${suraDetails.tamilName}${suraDetails.tamilMeaning != null ? ' - (${suraDetails.tamilMeaning})' : ''}';

      suraFullText.write('$header\n${'-' * header.length}\n');

      if (suraNumber != 1 && suraNumber != 9) {
        suraFullText.write('\n\n${quranProvider.bismillahArabic.text}');
        suraFullText.write('\n${quranProvider.bismillahTranslation.text}');
      }

      int loopLimit =
          suraDetails.verseCount < 100 ? suraDetails.verseCount : 100;

      for (int i = 1; i < loopLimit; i++) {
        final translationAya =
            quranProvider.filterOneAyaTranslation(suraNumber, i);
        String verseText = '\n\n${getArabicAyaList(translationAya, context)}'
            '\n${'${translationAya.ayaNumberList}. '}${getTamilTranslationList(translationAya, context)}';

        suraFullText.write(verseText);
      }

      if (suraDetails.verseCount > loopLimit) {
        suraFullText.write('\n\n*****');
        suraFullText.write('\n\n${ReadQuranTexts.downloadQuranApp}');
      }

      suraFullText.write('\n\n------------');
      suraFullText.write('\n${ReadQuranTexts.quranTranslation}');
      suraFullText
          .write('\n${ReadQuranTexts.chapter}:${suraDetails.suraNumber}');
      suraFullText.write(
          '\n${ReadQuranTexts.totalVerseCount}: ${suraDetails.verseCount}');
      suraFullText.write(
          '\n${ReadQuranTexts.translatedBy}: ${quranProvider.translations[quranProvider.selectedTranslation]}');
      suraFullText.write(
          '\n\n(${ReadQuranTexts.getTamilQuran}: ${AppConfig.appShortUrl} )');

      String suraText = suraFullText.toString();

      final clipboardData = ClipboardData(text: suraText);
      ShowToast.showToast(context, ReadQuranTexts.chapterCopied);
      await Clipboard.setData(
        clipboardData,
      );
    } catch (e) {
      rethrow;
    }
  }

  static String getArabicAyaList(
      QuranAya translationAya, BuildContext context) {
    String arabicText = '';
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);
    List<int> intList = translationAya.ayaNumberList
        .split(',')
        .map((str) => int.parse(str))
        .toList();

    for (int ayaNumber in intList) {
      arabicText += quranProvider
          .filterOneAyaArabic(translationAya.suraIndex, ayaNumber)
          .text;
      arabicText += '${QuranHelper.getVerseEndSymbol(ayaNumber)} ';
    }

    return arabicText;
  }

  static String getTamilTranslationList(
      QuranAya translationAya, BuildContext context) {
    String translationText = '';

    final regex = RegExp(r'\d+');
    final matches = regex.allMatches(translationAya.text);
    int previousMatchEnd = 0;

    for (final match in matches) {
      if (match.start > previousMatchEnd) {
        translationText +=
            translationAya.text.substring(previousMatchEnd, match.start);
      }
      previousMatchEnd = match.end;
    }

    if (previousMatchEnd < translationAya.text.length) {
      translationText += translationAya.text.substring(previousMatchEnd);
    }

    return translationText;
  }
}
