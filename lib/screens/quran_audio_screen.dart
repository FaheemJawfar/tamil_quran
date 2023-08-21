import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/providers/quran_provider.dart';

class QuranAudioPlayerScreen extends StatefulWidget {
//  final String audioUrl;
  const QuranAudioPlayerScreen(
      {
      //required this.audioUrl,
      Key? key})
      : super(key: key);

  @override
  State<QuranAudioPlayerScreen> createState() => _QuranAudioPlayerScreenState();
}

class _QuranAudioPlayerScreenState extends State<QuranAudioPlayerScreen> {
  late final quranProvider = context.read<QuranProvider>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  // String  url = getAudioURLBySurah(1);

  late AudioPlayer _audioPlayer;
  int selectedSuraIndex = 0;

  void _init() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer.setUrl(getAudioURLBySurah(selectedSuraIndex + 1));
      // print('\$' * 100);
      // print(_audioPlayer.duration);

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
      debugPrint(e.toString());
    }
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      body: ListView.builder(
        itemCount: quranProvider.suraList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${quranProvider.suraList[index].suraNumber}. ${quranProvider.suraList[index].tamilName}',
              style: TextStyle(
                color: selectedSuraIndex == index ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              //print(quranProvider.suraList[index].suraNumber);
              setState(() {
                selectedSuraIndex = index;
                _audioPlayer.dispose();
                _init();
                play();
                //buttonNotifier.value = ButtonState.playing;
              });
            },
            tileColor: selectedSuraIndex == index ? Colors.green[300] : null,
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
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
