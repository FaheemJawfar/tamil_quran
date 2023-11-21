import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/quran_audio_texts.dart';
import '../providers/quran_provider.dart';
import '../common_widgets/loading_indicator.dart';
import '../app_config/color_config.dart';
import '../utils/check_connection.dart';
import '../read_quran/quran_helper.dart';
import '../common_widgets/show_toast.dart';
import '../read_quran/sura_details.dart';
import '../home/home_popup_menu.dart';
import '../utils/image_uri.dart';
import 'audio_player_helper.dart';
import 'reciter_selector_popup.dart';

class QuranAudioPlayerScreen extends StatefulWidget {
  const QuranAudioPlayerScreen({super.key});

  @override
  State<QuranAudioPlayerScreen> createState() => _QuranAudioPlayerScreenState();
}

class _QuranAudioPlayerScreenState extends State<QuranAudioPlayerScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  int selectedSuraIndex = 0;

  late AudioPlayer audioPlayer = QuranAudioPlayerHelper.audioPlayer;
  bool isLoading = false;
  bool suraPlayed = false;
  Duration duration = const Duration();
  Duration position = const Duration();
  String currentUrl = '';

  @override
  void initState() {
    super.initState();
    //QuranAudioPlayerHelper.audioPlayer.dispose();
    initAudioPlayer();
  }

  initAudioPlayer(){
   try {
    // audioPlayer = QuranAudioPlayerHelper.audioPlayer;
     audioPlayer.durationStream.listen((updatedDuration) {
       if (!mounted) return;
       setState(() {
         duration = updatedDuration ?? Duration.zero;
       });
     });

     audioPlayer.positionStream.listen((updatedPosition) {
       if (!mounted) return;
       setState(() {
         position = updatedPosition;
       });
     });
   } catch (e){
     debugPrint(e.toString());
   }
  }



  Future<void> playAudio() async {
    try {
      setState(() {
        isLoading = true;
        suraPlayed = true;
      });

      String newUrl = QuranHelper.getAudioURLBySurah(
        quranProvider.selectedReciterDetails,
        selectedSuraIndex + 1,
      );

      if (currentUrl != newUrl) {
      //  await audioPlayer.setUrl(newUrl);
        
        await audioPlayer.setAudioSource(AudioSource.uri(
          Uri.parse(newUrl),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: selectedSuraIndex.toString(),
            // Metadata to display in the notification:
            album: quranProvider.selectedReciterDetails.name,
            title: getSuraName(selectedSuraIndex),
            artUri: await ImageUriParser.getImageFileFromAssets('assets/icon/quran_icon.png'),
          ),
        ),);
        currentUrl = newUrl;
        position = Duration.zero;
      }

      setState(() {
        audioPlayer.playing;
      });

      audioPlayer.play();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      bool hasInternet = await checkInternetConnection();
      if (!hasInternet) {
        return;
      }
    }
  }

  void pauseAudio() {
    audioPlayer.pause();
    setState(() {
      audioPlayer.playing;
    });
  }

  void seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  void playNext() {
    if (selectedSuraIndex != 113) {
      setState(() {
        selectedSuraIndex++;
      });
      playAudio();
    }
  }

  void playPrevious() {
    if (selectedSuraIndex != 0) {
      setState(() {
        selectedSuraIndex--;
      });
      playAudio();
    }
  }

  @override
  void dispose() {
   // audioPlayer.dispose();
    super.dispose();
  }

  Future<bool> checkInternetConnection() async {
    bool connected = await CheckConnection.checkInternetConnection();
    if (!connected) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ShowToast.showToast(context, QuranAudioTexts.checkInternetConnection);
      }
      return false;
    }
    return true;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours =
        (duration.inHours > 0) ? '${twoDigits(duration.inHours)}:' : '';
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours$minutes:$seconds";
  }

  String getSuraName(int index) {
    SuraDetails selectedSura = SuraDetails.suraListAll[index];

    if (selectedSura.tamilMeaning != null) {
      return '${selectedSura.tamilName} - (${selectedSura.tamilMeaning!})';
    }
    return selectedSura.tamilName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.contain,
            child: Text(quranProvider.selectedReciterDetails.name)),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReciterSelectorPopup(
                      reciters: quranProvider.allReciters,
                      selectedReciter:
                          quranProvider.selectedReciterDetails.identifier,
                      onSelected: (value) {
                        quranProvider.selectedReciter = value;
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit)),
          const HomeScreenPopupMenu(),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: SuraDetails.suraListAll.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${SuraDetails.suraListAll[index].suraNumber}. ${getSuraName(index)}',
                  style: TextStyle(
                      color: selectedSuraIndex == index
                          ? Colors.white
                          : quranProvider.isDarkMode
                              ? Colors.white70
                              : Colors.black,
                      fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    selectedSuraIndex = index;
                  });
                  playAudio();
                },
                tileColor: selectedSuraIndex == index
                    ? quranProvider.isDarkMode
                        ? Colors.black45
                        : Colors.green[300]
                    : null,
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color:
                  quranProvider.isDarkMode ? Colors.black45 : Colors.green[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Text(
                    getSuraName(selectedSuraIndex),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Slider(
                  value: suraPlayed ? position.inSeconds.toDouble(): 0,
                  min: 0.0,
                  max: suraPlayed ? duration.inSeconds.toDouble(): 0,
                  onChanged: (double value) {
                    seekAudio(Duration(seconds: value.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      suraPlayed ? formatDuration(position):formatDuration(Duration.zero),
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      isLoading || !suraPlayed
                          ? formatDuration(Duration.zero)
                          : formatDuration(duration),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 40,
                      ),
                      onPressed: playPrevious,
                    ),
                    IconButton(
                      icon: isLoading
                          ? LoadingIndicator(
                              color: quranProvider.isDarkMode
                                  ? Colors.grey
                                  : ColorConfig.primaryColor,
                            )
                          : audioPlayer.playing && suraPlayed
                              ? const Icon(
                                  Icons.pause,
                                  size: 40,
                                )
                              : const Icon(Icons.play_arrow, size: 40),
                      onPressed: audioPlayer.playing ? pauseAudio : playAudio,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next,
                        size: 40,
                      ),
                      onPressed: playNext,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
