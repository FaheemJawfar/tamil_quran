import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class VerseOptions {
  static Future<void> copyToClipboard(String text) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
  }

  static void shareVerse(String verse) {
    Share.share(verse);
  }
}
