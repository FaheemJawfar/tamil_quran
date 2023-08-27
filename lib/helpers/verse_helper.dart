import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/helpers/show_toast.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/models/verse.dart';
import 'package:tamil_quran/providers/quran_provider.dart';

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
    StringBuffer suraTextBuffer = StringBuffer();

    String header = '${suraModel.tamilName} - ( ${suraModel.tamilMeaning} )';

    suraTextBuffer.write('$header\n${'-' * header.length}\n\n');
    if (sura[0].sura != 1 && sura[0].sura != 9) {
      suraTextBuffer.write(
          '${'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ'}\nஅளவற்ற அருளாளனும், நிகரற்ற அன்புடையோனுமாகிய அல்லாஹ்வின் திருப்பெயரால்(துவங்குகிறேன்)\n\n');
    }
    for (var verse in sura) {
      String verseText =
          '\n\n${verse.arabic}${getVerseEndSymbol(verse.aya)}\n${verse.aya}. ${getTamilTranslation(verse)}';
      suraTextBuffer.write(verseText);
    }

    suraTextBuffer.write(
        '\n\n- (திருக்குர்ஆன் - அத்தியாயம் ${sura[0].sura})\n(மொத்த வசனங்கள்: ${sura.length})\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )');
    String suraText = suraTextBuffer.toString();
    // Share.share(suraText);

    final clipboardData = ClipboardData(text: suraText);
    try {
      ShowToast.showToast(context, 'அத்தியாயம் பிரதி செய்யப்பட்டது!');
      await Clipboard.setData(
        clipboardData,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static String getArabicVerse(VerseModel verse) {
    return '${verse.arabic}${getVerseEndSymbol(verse.aya)}';
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
