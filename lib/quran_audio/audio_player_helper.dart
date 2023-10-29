import 'dart:async';

import 'package:just_audio/just_audio.dart';

class AudioPlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late StreamSubscription<Duration?> _durationSubscription;
  late StreamSubscription<Duration?> _positionSubscription;
  late void Function() _onAudioFinished;

  Future<void> playFromUrl(String audioUrl, void Function() onAudioFinished) async {
    _onAudioFinished = onAudioFinished;

    _durationSubscription = _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        // When duration is available, the audio has started
        _positionSubscription = _audioPlayer.positionStream.listen((position) {
          if (position >= duration) {
            // The audio has completed
            _onAudioFinished();
          }
        });
      }
    });

    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      print('Error playing audio: $e');
    }
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
    // if(_durationSubscription != null){
       _durationSubscription.cancel();
    // }
    //
    // if(_positionSubscription != null){
       _positionSubscription.cancel();
    // }

    await _audioPlayer.dispose();
  }
}
