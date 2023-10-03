import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/helpers/quran_helper.dart';
import 'package:tamil_quran/helpers/show_toast.dart';

import '../config/app_config.dart';
import '../models/quran_aya.dart';
import '../models/sura_details.dart';

class VerseHelper {
  static Future<void> copyToClipboard(
      String text,
      BuildContext context,
      ) async {
    final clipboardData = ClipboardData(text: text);
    ShowToast.showToast(context, 'வசனம் பிரதி செய்யப்பட்டது!');
    await Clipboard.setData(clipboardData);
  }

  static String getVerseCopy( QuranAya arabic, QuranAya translation, int suraNumber, String option) {
    switch (option) {
      case 'copy':
        String verseCopy =
            '${getArabicVerse(arabic)}\n\n${translation.text}\n\n- (திருக்குர்ஆன் $suraNumber:${arabic.ayaIndex})\n\n( Tamil Quran for Android: ${AppConfig.appShortUrl} )';

        return verseCopy;

      case 'copy_arabic':
        String verseCopy =
            '${getArabicVerse(arabic)}\n\n- (திருக்குர்ஆன் $suraNumber:${arabic.ayaIndex})';

        return verseCopy;

      case 'copy_translation':
        String verseCopy =
            '${translation.text}\n\n- (திருக்குர்ஆன் $suraNumber:${arabic.ayaIndex})';
        return verseCopy;

      default:
        return '';
    }
  }

  static void shareVerse(String verse) {
    Share.share(verse);
  }

  static String getArabicVerse(QuranAya verse) {
    return '${verse.text}${QuranHelper.getVerseEndSymbol(verse.ayaIndex)}';
  }

  static Future<void> copySura(
      List<QuranAya> suraArabic, List<QuranAya> suraTranslation, int suraNumber, String selectedTranslationName, BuildContext context,) async {

    SuraDetails suraDetails = SuraDetails.suraList[suraNumber-1];
    try {
      StringBuffer suraFullText = StringBuffer();

      String header =
          '${suraDetails.tamilName}${suraDetails.tamilMeaning != null ? ' - (${suraDetails.tamilMeaning})': ''}';

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
            '\n\n*****\n(மீதமுள்ள வசனங்கள்: ${(suraArabic.length - 1)  - loopLimit})');
        suraFullText.write('\n\nஅத்தியாயத்தை முழுமையாக வாசிக்க Tamil Quran (திருக்குர்ஆன்) அப்ளிகேஷனை Download செய்யவும்.');
      }

      suraFullText.write('\n\n------------');
      suraFullText.write('\nதிருக்குர்ஆன் தமிழாக்கம்');
      suraFullText.write('\nஅத்தியாயம்:${suraDetails.suraNumber}');
      suraFullText.write('\nமொத்த வசனங்கள்: ${suraDetails.verseCount}');
      suraFullText.write('\nமொழிபெயர்ப்பு: $selectedTranslationName');
      suraFullText.write('\n\n(Tamil Quran for Android: ${AppConfig.appShortUrl} )');

      String suraText = suraFullText.toString();

      final clipboardData = ClipboardData(text: suraText);
      ShowToast.showToast(context, 'அத்தியாயம் பிரதி செய்யப்பட்டது!');
      await Clipboard.setData(
        clipboardData,
      );
    } catch (e) {
      rethrow;
    }
  }


}












// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:tamil_quran/helpers/quran_helper.dart';
// import 'package:tamil_quran/helpers/show_toast.dart';
// import 'package:tamil_quran/models/sura_details.dart';
// import 'package:tamil_quran/models/quran_aya.dart';
// import '../providers/settings_provider.dart';
//
// class VerseHelper {
//   static Future<void> copyToClipboard(
//     String text,
//     BuildContext context,
//   ) async {
//     final clipboardData = ClipboardData(text: text);
//     ShowToast.showToast(context, 'வசனம் பிரதி செய்யப்பட்டது!');
//     await Clipboard.setData(clipboardData);
//   }
//
//   static String getVerseCopy(QuranAya selectedVerse, String option) {
//     switch (option) {
//       case 'copy':
//         String verseCopy =
//             '${getArabicVerse(selectedVerse)}\n\n${getTamilTranslation(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.suraIndex}:${selectedVerse.ayaIndex})\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )';
//
//         return verseCopy;
//
//       case 'copy_arabic':
//         String verseCopy =
//             '${getArabicVerse(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.suraIndex}:${selectedVerse.ayaIndex})';
//
//         return verseCopy;
//
//       case 'copy_tamil':
//         String verseCopy =
//             '${getTamilTranslation(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.suraIndex}:${selectedVerse.ayaIndex})';
//         return verseCopy;
//
//       default:
//         return '';
//     }
//   }
//
//   static void shareVerse(String verse) {
//     Share.share(verse);
//   }
//
//   static Future<void> copySura(
//       List<QuranAya> sura, BuildContext context, SuraDetails suraModel) async {
//     try {
//       // StringBuffer suraTextBuffer = StringBuffer();
//       //
//       // String header =
//       //     '${suraModel.tamilName}${suraModel.tamilMeaning != null ? ' - ( ${suraModel.tamilMeaning} )' : ''}';
//       //
//       // suraTextBuffer.write('$header\n${'-' * header.length}\n');
//       //
//       // int loopLimit = sura.length < 100 ? sura.length : 100;
//       //
//       // for (int i = 0; i < loopLimit; i++) {
//       //   final verse = sura[i];
//       //
//       //   bool suraStartsWithBismillah =
//       //       verse.ayaIndex == 1 && verse.suraIndex == 1 && suraModel.suraNumber != 1;
//       //
//       //   String verseText =
//       //       '\n\n${verse.arabic}${suraStartsWithBismillah ? '' : QuranHelper.getVerseEndSymbol(verse.ayaNumber)}'
//       //       '\n${suraStartsWithBismillah ? '' : '${verse.ayaNumber.toString()}. '}${getTamilTranslation(verse)}';
//       //
//       //   suraTextBuffer.write(verseText);
//       // }
//       //
//       // if (sura.length > 100) {
//       //   suraTextBuffer.write(
//       //       '\n\n*****\n( மீதமுள்ள வசனங்கள்: ${sura.length - 100} )\n\nஅத்தியாயத்தை முழுமையாக வாசிக்க எமது Tamil Quran அப்ளிகேஷனை Download செய்யவும்:');
//       // }
//       //
//       // suraTextBuffer.write(
//       //     '\n\nதிருக்குர்ஆன்:\nஅத்தியாயம்:${suraModel.suraNumber} - வசனங்கள்: ${suraModel.verseCount}\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )');
//       // String suraText = suraTextBuffer.toString();
//       //
//       // final clipboardData = ClipboardData(text: suraText);
//       // ShowToast.showToast(context, 'அத்தியாயம் பிரதி செய்யப்பட்டது!');
//       // await Clipboard.setData(
//       //   clipboardData,
//       // );
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   static String getArabicVerse(QuranAya verse) {
//     //return '${verse.arabic}${QuranHelper.getVerseEndSymbol(verse.ayaNumber)}';
//     return '';
//   }
//
//   static String getTamilTranslation(QuranAya verse) {
//     String selectedTranslation = SettingsProvider().selectedTranslation;
//
//     return '';
//     // switch (selectedTranslation) {
//     //   case 'mJohn':
//     //     return verse.mJohn;
//     //   case 'kingFahd':
//     //     return verse.kingFahd;
//     //
//     //   case 'ift':
//     //     return verse.ift;
//     //
//     //   case 'abdulHameed':
//     //     return verse.abdulHameed;
//     //
//     //   default:
//     //     return verse.mJohn;
//     // }
//   }
// }


