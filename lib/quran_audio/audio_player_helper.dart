import 'dart:async';
import 'package:just_audio/just_audio.dart';

class QuranAudioPlayerHelper {

  static AudioPlayer audioPlayer = AudioPlayer(
    audioPipeline: AudioPipeline(
      androidAudioEffects: [],
    ),
  );

  Future<void> playFromUrl(
      String audioUrl, void Function() onAudioFinished) async {
    await audioPlayer.setUrl(audioUrl);
    await audioPlayer.play();

    audioPlayer.playerStateStream.listen((playerState) {
      if (!audioPlayer.playing) {
        // The audio has completed
        onAudioFinished();
      }
    });
  }

  static void playAudioPlayList(
      List<AudioSource> playList, void Function() onAudioFinished) async {

    // Define the playlist
    final playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      children: playList,
    );

    await audioPlayer.setAudioSource(playlist,
        initialIndex: 0, initialPosition: Duration.zero);
    await audioPlayer.play();

    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        onAudioFinished();
      }
    });
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  Future<void> seek(Duration position) async {
    await audioPlayer.seek(position);
  }

  Future<void> dispose() async {
    await audioPlayer.dispose();
  }
}
