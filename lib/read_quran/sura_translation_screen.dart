import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tamil_quran/read_quran/quran_aya.dart';
import 'package:tamil_quran/read_quran/quran_helper.dart';
import '../app_texts/read_quran_texts.dart';
import '../common_widgets/show_toast.dart';
import '../quran_audio/audio_player_helper.dart';
import '../utils/check_connection.dart';
import 'read_sura_appbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../app_config/color_config.dart';
import '../utils/shared_preferences.dart';
import '../providers/quran_provider.dart';
import 'show_verse.dart';

class SuraTranslationScreen extends StatefulWidget {
  final int goToVerse;

  const SuraTranslationScreen({
    this.goToVerse = 0,
    super.key,
  });

  @override
  State<SuraTranslationScreen> createState() => _SuraTranslationScreenState();
}

class _SuraTranslationScreenState extends State<SuraTranslationScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  final scrollController = ItemScrollController();
  bool isPlaying = false;
  int currentPlayingSuraIndex = 0;
  int currentPlayingAyaIndex = 0;


  @override
  void initState() {
    super.initState();
    scrollToVerse();
  }

  void scrollToVerse() {
    if (widget.goToVerse > 0) {
      int index = widget.goToVerse;
      int suraNumber =
          Provider.of<QuranProvider>(context, listen: false).selectedSuraNumber;
      if (suraNumber == 1 || suraNumber == 9) {
        index--;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _updateLastSeen(int suraNumber, int verseNumber) {
    AppPreferences.setInt('lastSeenSura', suraNumber);
    AppPreferences.setInt('lastSeenVerse', verseNumber);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: ReadSuraAppBar(
        tamilScrollController: scrollController,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ScrollablePositionedList.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: quranProvider.isDarkMode ? null : ColorConfig.primaryColor),
                itemScrollController: scrollController,
                itemCount: quranProvider.selectedSuraTranslation.length,
                itemBuilder: (BuildContext context, int index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) => _updateLastSeen(
                        quranProvider.selectedSuraNumber, index),
                    child: ShowVerse(
                      quranAyaArabic: quranProvider.selectedSuraArabic[index],
                      quranAyaTranslation:
                          quranProvider.selectedSuraTranslation[index],
                      playAudio: () => playAudio(quranProvider.selectedSuraTranslation[index]),
                      stopAudio: () => stopAudio(),
                      isPlaying: isPlaying
                          && currentPlayingSuraIndex == quranProvider.selectedSuraTranslation[index].suraIndex
                          && currentPlayingAyaIndex == index,

                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> playAudio(QuranAya translation) async {

    updateCurrentAyaIndex(translation);

    setState(() {
      isPlaying = true;
    });

    bool internetConnected = await CheckConnection.checkInternetConnection();

    if(!internetConnected){
      if(!mounted) return;
      ShowToast.showToast(context, ReadQuranTexts.noInternet);
      setState(() {
        isPlaying = false;
      });
      return;
    }

    try {
      List<AudioSource> listOfAudioSource = [];
      List<int> ayaList = translation.ayaNumberList
          .split(',')
          .map((str) => int.parse(str))
          .toList();

      for (var aya in ayaList) {
        listOfAudioSource.add(AudioSource.uri(Uri.parse(
          QuranHelper.getAudioURLByAya(translation.suraIndex, aya),
        ),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: aya.toString(),
            // Metadata to display in the notification:
            album: quranProvider.selectedReciterDetails.name,
            title: 'திருக்குர்ஆன் (${translation.suraIndex}:$aya)',
            //  artUri: Uri.parse('file:///android_asset/flutter_assets/assets/icon/quran_icon.png'),
          ),
        ));
      }

      QuranAudioPlayerHelper.playAudioPlayList(listOfAudioSource, () {
       if(!mounted) return;
       setState(() {
         isPlaying = false;
       });

      });
    } catch (e){
      debugPrint(e.toString());
    }
  }


  updateCurrentAyaIndex(QuranAya translation){
    if(translation.suraIndex == 1 || translation.suraIndex == 9){
      currentPlayingSuraIndex = translation.suraIndex;
      currentPlayingAyaIndex = translation.ayaIndex - 1;
    }
    else{
      currentPlayingSuraIndex = translation.suraIndex;
      currentPlayingAyaIndex = translation.ayaIndex;
    }
  }


  void stopAudio() {
    setState(() {
    isPlaying = false;
    });
    QuranAudioPlayerHelper.audioPlayer.stop();
  }


  @override
  void dispose() {
    super.dispose();
  }

}
