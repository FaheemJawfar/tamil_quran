import 'dart:async';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHelper {
  final _audioPlayer = AudioPlayer();

  Future<void> playFromUrl(
      String audioUrl, void Function() onAudioFinished) async {
    await _audioPlayer.setUrl(audioUrl);
    await _audioPlayer.play();

    _audioPlayer.playerStateStream.listen((playerState) {
      if (!_audioPlayer.playing) {
        // The audio has completed
        onAudioFinished();
      }
    });
  }

  playAudioPlayList(
      List<AudioSource> playList, void Function() onAudioFinished) async {
    // Define the playlist
    final playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      children: playList,
    );

    await _audioPlayer.setAudioSource(playlist,
        initialIndex: 0, initialPosition: Duration.zero);
    await _audioPlayer.play();

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        onAudioFinished();
      }
    });
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
