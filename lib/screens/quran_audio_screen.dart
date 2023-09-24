import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/check_connection.dart';
import 'package:tamil_quran/helpers/quran_helper.dart';
import 'package:tamil_quran/helpers/show_toast.dart';
import 'package:tamil_quran/models/sura_details.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/providers/settings_provider.dart';
import 'package:tamil_quran/widgets/reciter_selector_popup.dart';
import '../widgets/home_popup_menu.dart';

class QuranAudioPlayerScreen extends StatefulWidget {
  const QuranAudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<QuranAudioPlayerScreen> createState() => _QuranAudioPlayerScreenState();
}

class _QuranAudioPlayerScreenState extends State<QuranAudioPlayerScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  late final settingsProvider =
      Provider.of<SettingsProvider>(context, listen: true);
  late AudioPlayer _audioPlayer;
  int selectedSuraIndex = 0;

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer.setUrl(QuranHelper.getAudioURLBySurah(
          settingsProvider.selectedReciterDetails, selectedSuraIndex + 1));

      _audioPlayer.playerStateStream.listen((playerState) {
        final isPlaying = playerState.playing;
        final processingState = playerState.processingState;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          buttonNotifier.value = ButtonState.loading;
        } else if (!isPlaying) {
          buttonNotifier.value = ButtonState.paused;
        } else if (processingState != ProcessingState.completed) {
          buttonNotifier.value = ButtonState.playing;
        } else {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.pause();
        }
      });

      _audioPlayer.positionStream.listen((position) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: position,
          buffered: oldState.buffered,
          total: oldState.total,
        );
      });

      _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: bufferedPosition,
          total: oldState.total,
        );
      });

      _audioPlayer.durationStream.listen((totalDuration) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: oldState.buffered,
          total: totalDuration ?? Duration.zero,
        );
      });
    } catch (e) {
      debugPrint('Error: ${e.toString()}!');
      checkInternetConnection();
    }
  }

  Future<void> checkInternetConnection() async {
    bool connected = await CheckConnection.checkInternetConnection();

    if(!connected){
      if(!mounted) return;
      ShowToast.showToast(context, 'Please check your Internet connection!');
    }
  }

  void play() {
    _init();
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
                settingsProvider.selectedReciterDetails.name)),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReciterSelectorPopup(
                      reciters: settingsProvider.allReciters,
                      selectedReciter:
                          settingsProvider.selectedReciterDetails.identifier,
                      onSelected: (value) {
                        settingsProvider.selectedReciter = value;
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit)),
          const HomeScreenPopupMenu(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: SuraDetails.suraList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${SuraDetails.suraList[index].suraNumber}. ${SuraDetails.suraList[index].tamilName}',
                    style: TextStyle(
                      color: selectedSuraIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedSuraIndex = index;
                      _audioPlayer.dispose();
                      play();
                    });
                  },
                  tileColor:
                      selectedSuraIndex == index ? Colors.green[300] : null,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: seek,
                );
              },
            ),
            ValueListenableBuilder<ButtonState>(
              valueListenable: buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: const CircularProgressIndicator(),
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: play,
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: const Icon(Icons.pause),
                      iconSize: 32.0,
                      onPressed: pause,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }


}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
