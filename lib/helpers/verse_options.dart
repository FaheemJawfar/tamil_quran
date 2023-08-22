import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/models/verse.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:provider/provider.dart';

class VerseHelper {
  static Future<void> copyToClipboard(String text) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
  }

  static void shareVerse(String verse) {
    Share.share(verse);
  }

  static String getTamilTranslation(VerseModel verse) {
    String? selectedTranslation =
        Preferences.getString('selectedTranslation');

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
