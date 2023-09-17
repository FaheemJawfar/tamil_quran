import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/helpers/quran_helper.dart';
import 'package:tamil_quran/helpers/show_toast.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/models/verse.dart';
import '../providers/settings_provider.dart';

class VerseHelper {
  static Future<void> copyToClipboard(
    String text,
    BuildContext context,
  ) async {
    final clipboardData = ClipboardData(text: text);
    ShowToast.showToast(context, 'வசனம் பிரதி செய்யப்பட்டது!');
    await Clipboard.setData(clipboardData);
  }

  static String getVerseCopy(VerseModel selectedVerse, String option) {
    switch (option) {
      case 'copy':
        String verseCopy =
            '${getArabicVerse(selectedVerse)}\n\n${getTamilTranslation(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )';

        return verseCopy;

      case 'copy_arabic':
        String verseCopy =
            '${getArabicVerse(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})';

        return verseCopy;

      case 'copy_tamil':
        String verseCopy =
            '${getTamilTranslation(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})';
        return verseCopy;

      default:
        return '';
    }
  }

  static void shareVerse(String verse) {
    Share.share(verse);
  }

  static Future<void> copySura(
      List<VerseModel> sura, BuildContext context, SuraModel suraModel) async {
    try {
      StringBuffer suraTextBuffer = StringBuffer();

      String header =
          '${suraModel.tamilName}${suraModel.tamilMeaning != null ? ' - ( ${suraModel.tamilMeaning} )' : ''}';

      suraTextBuffer.write('$header\n${'-' * header.length}\n');

      int loopLimit = sura.length < 100 ? sura.length : 100;

      for (int i = 0; i < loopLimit; i++) {
        final verse = sura[i];

        bool suraStartsWithBismillah =
            verse.index == 1 && verse.sura == 1 && suraModel.suraNumber != 1;

        String verseText =
            '\n\n${verse.arabic}${suraStartsWithBismillah ? '' : QuranHelper.getVerseEndSymbol(verse.aya)}'
            '\n${suraStartsWithBismillah ? '' : '${verse.aya.toString()}. '}${getTamilTranslation(verse)}';

        suraTextBuffer.write(verseText);
      }

      if (sura.length > 100) {
        suraTextBuffer.write(
            '\n\n*****\n( மீதமுள்ள வசனங்கள்: ${sura.length - 100} )\n\nஅத்தியாயத்தை முழுமையாக வாசிக்க எமது Tamil Quran அப்ளிகேஷனை Download செய்யவும்:');
      }

      suraTextBuffer.write(
          '\n\nதிருக்குர்ஆன்:\nஅத்தியாயம்:${suraModel.suraNumber} - வசனங்கள்: ${suraModel.verseCount}\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )');
      String suraText = suraTextBuffer.toString();

      final clipboardData = ClipboardData(text: suraText);
      ShowToast.showToast(context, 'அத்தியாயம் பிரதி செய்யப்பட்டது!');
      await Clipboard.setData(
        clipboardData,
      );
    } catch (e) {
      rethrow;
    }
  }

  static String getArabicVerse(VerseModel verse) {
    return '${verse.arabic}${QuranHelper.getVerseEndSymbol(verse.aya)}';
  }

  static String getTamilTranslation(VerseModel verse) {
    String selectedTranslation = SettingsProvider().selectedTranslation;

    switch (selectedTranslation) {
      case 'mJohn':
        return verse.mJohn;
      case 'kingFahd':
        return verse.kingFahd;

      case 'ift':
        return verse.ift;

      case 'abdulHameed':
        return verse.abdulHameed;

      default:
        return verse.mJohn;
    }
  }
}
