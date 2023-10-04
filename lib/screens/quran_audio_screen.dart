import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/widgets/loading_indicator.dart';
import '../config/color_config.dart';
import '../helpers/check_connection.dart';
import '../helpers/quran_helper.dart';
import '../helpers/show_toast.dart';
import '../models/sura_details.dart';
import '../widgets/home_popup_menu.dart';
import '../widgets/reciter_selector_popup.dart';

class QuranAudioPlayerScreen extends StatefulWidget {
  const QuranAudioPlayerScreen({super.key});

  @override
  State<QuranAudioPlayerScreen> createState() => _QuranAudioPlayerScreenState();
}

class _QuranAudioPlayerScreenState extends State<QuranAudioPlayerScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);
  int selectedSuraIndex = 0;
  late AudioPlayer audioPlayer;

  bool isPlaying = false;
  bool isLoading = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      setState(() {
        duration = updatedDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((updatedPosition) {
      setState(() {
        position = updatedPosition;
      });
    });
  }

  void playAudio() {
    checkInternetConnection();
    setState(() {
      isLoading = true;
      position = Duration.zero;
    });

    audioPlayer.play(UrlSource(QuranHelper.getAudioURLBySurah(
        quranProvider.selectedReciterDetails, selectedSuraIndex + 1)));

    setState(() {
      isPlaying = true;
    });



    audioPlayer.onPlayerStateChanged.listen((event) {
    //  if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    });

  }

  void pauseAudio() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
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
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> checkInternetConnection() async {
    bool connected = await CheckConnection.checkInternetConnection();

    if (!connected) {
      if (!mounted) return;
      ShowToast.showToast(context, 'Please check your Internet connection!');
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours =
        (duration.inHours > 0) ? '${twoDigits(duration.inHours)}:' : '';
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
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
            itemCount: SuraDetails.suraList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${SuraDetails.suraList[index].suraNumber}. ${SuraDetails.suraList[index].tamilName}',
                  style: TextStyle(
                      color: selectedSuraIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    selectedSuraIndex = index;
                  });
                  playAudio();
                },
                tileColor:
                    selectedSuraIndex == index ? Colors.green[300] : null,
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding:
                const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    seekAudio(Duration(seconds: value.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isLoading ? '--:--' : formatDuration(position),
                      style: const TextStyle(fontSize: 18),
                    ),

                    Text(
                      isLoading ? '--:--' : formatDuration(duration),
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
                    isLoading
                        ? LoadingIndicator(
                            size: 40,
                            color: ColorConfig.primaryColor,
                          )
                        : IconButton(
                            icon: isPlaying
                                ? const Icon(
                                    Icons.pause,
                                    size: 40,
                                  )
                                : const Icon(Icons.play_arrow, size: 40),
                            onPressed: isPlaying ? pauseAudio : playAudio,
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
