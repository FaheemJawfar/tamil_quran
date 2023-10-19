import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_config/color_config.dart';
import 'package:tamil_quran/read_quran/explaination_popup.dart';
import '../app_texts/read_quran_texts.dart';
import '../bookmarks/bookmark_helper.dart';
import 'quran_helper.dart';
import 'verse_helper.dart';
import '../bookmarks/bookmark.dart';
import 'quran_aya.dart';
import '../providers/quran_provider.dart';

class ShowVersePJ extends StatefulWidget {
  final QuranAya quranAyaArabic;
  final QuranAya quranAyaTranslation;

  const ShowVersePJ(
      {required this.quranAyaArabic,
      required this.quranAyaTranslation,
      Key? key})
      : super(key: key);

  @override
  State<ShowVersePJ> createState() => _ShowVersePJState();
}

class _ShowVersePJState extends State<ShowVersePJ> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);



  TextSpan getArabicAyaList(QuranAya quranAya) {
    List<int> intList = quranAya.ayaNumberList.split(',').map((str) => int.parse(str)).toList();

    List<InlineSpan> spans = [];

    for (int ayaNumber in intList) {
      spans.add(
        TextSpan(
          text: quranProvider.filterOneAyaArabic(quranAya.suraIndex, ayaNumber).text,
          style: TextStyle(
            fontSize: quranProvider.arabicFontSize,
            fontFamily: quranProvider.arabicFont,
            color: quranProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      );
        spans.add(
          TextSpan(
            text: '${QuranHelper.getVerseEndSymbol(ayaNumber)} ',
            style: TextStyle(
              fontSize: 18,
              color: quranProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        );

    }

    return TextSpan(children: spans);
  }


  RichText getTranslationWithTappableNumbers(String text) {
    final regex = RegExp(r'\d+'); // This regex matches one or more digits in the text.

    final matches = regex.allMatches(text);

    final spans = <InlineSpan>[];
    int previousMatchEnd = 0;

    for (final match in matches) {
      if (match.start > previousMatchEnd) {
        // Add non-tappable text before the number
        spans.add(TextSpan(
          text: text.substring(previousMatchEnd, match.start),
          style: TextStyle(
            fontSize: quranProvider.tamilFontSize,
            fontFamily: quranProvider.tamilFont,
            color: quranProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ));
      }

      // Wrap the number and position it above the text using a Stack
      spans.add(
        WidgetSpan(
          child: Stack(
            children: [
              Text(
                text.substring(match.start, match.end),
                style: TextStyle(
                  fontSize: quranProvider.tamilFontSize * 0.8, // Adjust the size as needed
                  fontFamily: quranProvider.tamilFont,
                  color: Colors.red, // Color for the tappable number
                ),
              ),
              Positioned(
                top: -quranProvider.tamilFontSize * 0.4, // Adjust the position as needed
                child: GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    width: 50.0, // Adjust the width as needed
                    height: 50.0, // Adjust the height as needed
                  ),
                  onTap: () {
                    int tappedNumber = int.parse(text.substring(match.start, match.end));

                    showExplanationPopup(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

      previousMatchEnd = match.end;
    }

    // Add any remaining non-tappable text after the last number
    if (previousMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(previousMatchEnd),
        style: TextStyle(
          fontSize: quranProvider.tamilFontSize,
          fontFamily: quranProvider.tamilFont,
          color: quranProvider.isDarkMode ? Colors.white : Colors.black,
        ),
      ));
    }

    return RichText(text: TextSpan(children: spans));
  }






  @override
  Widget build(BuildContext context) {
    return widget.quranAyaTranslation.ayaIndex == 0
        ? buildBismi() : buildVerse();
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: quranProvider.isDarkMode ? null : Colors.green.shade700,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  Widget _buildOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.quranAyaTranslation.ayaNumberList}. ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: quranProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        PopupMenuButton<String>(
          color: quranProvider.isDarkMode ? null : Colors.green.shade100,
          onSelected: (String value) {
            switch (value) {
              case 'shareVerse':
                VerseHelper.shareVerse(VerseHelper.getVerseCopy(
                    widget.quranAyaArabic,
                    widget.quranAyaTranslation,
                    quranProvider.selectedSuraNumber,
                    'copy'));
                break;
              case 'addBookmark':
                BookmarkHelper.addBookmark(
                  Bookmark(
                    suraNumber: quranProvider.selectedSuraNumber.toString(),
                    verseNumber: widget.quranAyaTranslation.ayaIndex.toString(),
                  ),
                  context,
                );
                break;
              case 'copy':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy'),
                    context);
                break;
              case 'copy_arabic':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_arabic'),
                    context);

                break;
              case 'copy_translation':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_translation'),
                    context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'shareVerse',
              child: getPopupMenuItem(Icons.share, ReadQuranTexts.share),
            ),
            PopupMenuItem<String>(
              value: 'addBookmark',
              child: getPopupMenuItem(
                  Icons.bookmark_add_outlined, ReadQuranTexts.addBookmark),
            ),
            PopupMenuItem<String>(
              value: 'copy',
              child: getPopupMenuItem(
                  Icons.copy, ReadQuranTexts.copyArabicAndTranslation),
            ),
            PopupMenuItem<String>(
              value: 'copy_arabic',
              child: getPopupMenuItem(Icons.copy, ReadQuranTexts.copyArabic),
            ),
            PopupMenuItem<String>(
              value: 'copy_translation',
              child:
                  getPopupMenuItem(Icons.copy, ReadQuranTexts.copyTranslation),
            ),
          ],
          child: const Icon(Icons.more_vert),
        )
      ],
    );
  }

  Widget buildVerse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _buildOptionsRow(),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: getArabicAyaList(widget.quranAyaTranslation),
                ),
              ),
              const SizedBox(height: 8),
              getTranslationWithTappableNumbers(widget.quranAyaTranslation.text),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBismi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child:  Text(
                  quranProvider.bismillahArabic.text,
                  style: TextStyle(
                    fontSize: quranProvider.arabicFontSize,
                    fontFamily: quranProvider.arabicFont,
                    color: quranProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                quranProvider.bismillahTranslation.text,
                style: TextStyle(
                  fontSize: quranProvider.tamilFontSize,
                  fontFamily: quranProvider.tamilFont,
                  color: quranProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  void showExplanationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ExplanationPopup(
          headerText: '1. மறுமை நாள்',
          bodyText: '1. மறுமை நாள் வானம், பூமி, சூரியன், விண்கோள்கள், பூமியில் வாழும் மனிதர்கள், உயிரினங்கள், தாவரங்கள் உட்பட அனைத்தும் ஒரு நாள் அழிக்கப்படும். அந்நாளில் இறைவன் மட்டுமே நிலைத்திருப்பான். யுகமுடிவு நாள், இறுதி நாள், ஸூர் ஊதப்படும் நாள் போன்ற பல்வேறு சொற்களால் இந்த நாள் குறிப்பிடப்படுகிறது. உலகம் அழிக்கப்பட்ட பின்னர் மனிதர்கள் அனைவரும் மீண்டும் உயிர் கொடுக்கப்பட்டு விசாரிக்கப்படுவர். விசாரணைக்குப் பின் தீர்ப்பு வழங்கப்படும். நல்லவர்களுக்குப் பேரின்பம் கிடைக்கும். கெட்டவர்களுக்குத் துன்புறுத்தும் பலவிதமான தண்டனைகள் வழங்கப்படும். இவ்வாழ்விற்கு அழிவே இராது. மறுமை, மறுஉலகம், அவ்வுலகம், தீர்ப்பு நாள், ஒன்று திரட்டப்படும் நாள், யாரும் யாருக்கும் உதவ முடியாத நாள், திரும்பச் செல்லும் நாள், கூலி வழங்கும் நாள், விசாரிக்கப்படும் நாள், பயன் தரும் நாள், உயிர்ப்பிக்கப்படும் நாள், இறைவனைச் சந்திக்கும் நாள், கைசேதப்படும் நாள், இறைவன் முன்னால் நிற்கும் நாள், தப்பிக்க இயலாத நாள், எழுப்பப்படும் நாள் இன்னும் பல பெயர்களால் இந்த நாள் குறிப்பிடப்படுகிறது. சந்தேகம் இல்லாத நாள், மகத்தான நாள், அந்நாள், அந்நேரம், வாக்களிக்கப்பட்ட நாள், எந்தச் சந்தேகமும் இல்லாத நாள் போன்ற சொற்கள் அழிக்கப்படும் நாளுக்கும், உயிர்ப்பிக்கப்படும் நாளுக்கும் பொதுவானவை. அழிக்கப்படும் நாள், மீண்டும் உயிர்ப்பிக்கும் நாள் ஆகிய இரு நாட்களும் எப்போது ஏற்படும் என்பதை நபிகள் நாயகம் (ஸல்) அவர்கள் உள்ளிட்ட எந்த மனிதரும், ஏன் வானவர்களும் கூட அறிய மாட்டார்கள். அந்த நாள் எப்போது வரும் என்பது அல்லாஹ்வுக்கு மட்டுமே தெரிந்த இரகசியம் என்று 7:187, 20:15, 33:63, 79:42 ஆகிய வசனங்கள் கூறுகின்றன. இவ்வுலகில் மனிதன் நல்லவனாக வாழ இத்தகைய ஒரு நாளை நம்புவது பெரிதும் உதவும் என்பது கவனத்தில் கொள்ள வேண்டியதாகும். (இந்நாள் குறித்து அதிக விபரங்கள் அறிய பொருள் அட்டவணை பகுதியில் கியாமத் நாள் - இறுதி நாள் என்ற தலைப்பில் காண்க!)',
        );
      },
    );
  }

}
