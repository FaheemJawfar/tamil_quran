import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/helpers/show_toast.dart';
import 'package:tamil_quran/models/verse.dart';

import '../providers/settings_provider.dart';

class VerseHelper {
  static Future<void> copyToClipboard(String text, BuildContext context) async {
    final clipboardData = ClipboardData(text: text);
    ShowToast.showToast(context, 'வசனம் பிரதி செய்யப்பட்டது!');
    await Clipboard.setData(clipboardData);
  }

  static String getVerseCopy(VerseModel selectedVerse, String option) {
    switch(option) {
      case 'copy':
        String verseCopy =
            '${selectedVerse.arabic}\n\n${getTamilTranslation(selectedVerse)}\n\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})\n\n( Tamil Quran for Android: https://bit.ly/TamilQuran )';

        return verseCopy;


      case 'copy_arabic':
        String verseCopy =
            '${selectedVerse.arabic}\n\n- (திருக்குர்ஆன் ${selectedVerse.sura}:${selectedVerse.aya})';

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
