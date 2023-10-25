import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
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

  static String getVerseCopy(QuranAya arabic, QuranAya translationAya,
      int suraNumber, String option, BuildContext context) {
    String arabicText = '';
    String translationText = '';
    final quranProvider = Provider.of<QuranProvider>(context, listen: false);
    List<int> intList = translationAya.ayaNumberList
        .split(',')
        .map((str) => int.parse(str))
        .toList();

    for (int ayaNumber in intList) {
      arabicText +=
          quranProvider.filterOneAyaArabic(arabic.suraIndex, ayaNumber).text;
      arabicText += '${QuranHelper.getVerseEndSymbol(ayaNumber)} ';
    }

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

    switch (option) {
      case 'copy':
        String verseCopy =
            '$arabicText\n\n$translationText\n\n- (${ReadQuranTexts.holyQuran} $suraNumber:${translationAya.ayaNumberList})\n\n( ${ReadQuranTexts.quranAppForAndroid}: ${AppConfig.appShortUrl} )';

        return verseCopy;

      case 'copy_arabic':
        String verseCopy =
            '$arabicText\n\n- (${ReadQuranTexts.holyQuran} $suraNumber:${translationAya.ayaNumberList})';

        return verseCopy;

      case 'copy_translation':
        String verseCopy =
            '$translationText\n\n- (${ReadQuranTexts.holyQuran} $suraNumber:${translationAya.ayaNumberList})';
        return verseCopy;

      default:
        return '';
    }
  }

  static void shareVerse(String verse) {
    Share.share(verse);
  }

  static Future<void> copySura(
    List<QuranAya> suraArabic,
    List<QuranAya> suraTranslation,
    int suraNumber,
    String selectedTranslationName,
    BuildContext context,
  ) async {
    SuraDetails suraDetails = SuraDetails.suraList[suraNumber - 1];
    try {
      StringBuffer suraFullText = StringBuffer();

      String header =
          '${suraDetails.tamilName}${suraDetails.tamilMeaning != null ? ' - (${suraDetails.tamilMeaning})' : ''}';

      suraFullText.write('$header\n${'-' * header.length}\n');

      int loopLimit = suraArabic.length < 100 ? suraArabic.length : 100;

      for (int i = 0; i < loopLimit; i++) {
        final arabicVerse = suraArabic[i];
        final translationOfVerse = suraTranslation[i];

        bool suraStartsWithBismillah = arabicVerse.ayaIndex == 0;

        String verseText =
            '\n\n${arabicVerse.text}${suraStartsWithBismillah ? '' : QuranHelper.getVerseEndSymbol(arabicVerse.ayaIndex)}'
            '\n${suraStartsWithBismillah ? '' : '${translationOfVerse.ayaIndex.toString()}. '}${translationOfVerse.text}';

        suraFullText.write(verseText);
      }

      if (suraArabic.length > loopLimit) {
        suraFullText.write(
            '\n\n*****\n(${ReadQuranTexts.balancedVerseCount}: ${(suraArabic.length - 1) - loopLimit})');
        suraFullText.write('\n\n${ReadQuranTexts.downloadQuranApp}');
      }

      suraFullText.write('\n\n------------');
      suraFullText.write('\n${ReadQuranTexts.quranTranslation}');
      suraFullText
          .write('\n${ReadQuranTexts.chapter}:${suraDetails.suraNumber}');
      suraFullText.write(
          '\n${ReadQuranTexts.totalVerseCount}: ${suraDetails.verseCount}');
      suraFullText
          .write('\n${ReadQuranTexts.translatedBy}: $selectedTranslationName');
      suraFullText.write(
          '\n\n(${ReadQuranTexts.quranAppForAndroid}: ${AppConfig.appShortUrl} )');

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
}
