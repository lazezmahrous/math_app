import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  AudioPlayerProvider() {
    _player.onDurationChanged.listen((duration) {
      totalDuration = duration;
      notifyListeners();
    });

    _player.onPositionChanged.listen((position) {
      currentPosition = position;
      notifyListeners();
    });

    _player.onPlayerComplete.listen((event) {
      isPlaying = false;
      notifyListeners();
    });
  }

  void play(String soundSource) async {
    if (isPlaying) {
      await _player.stop();
    }
    await _player.play(AssetSource(soundSource));
    isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _player.pause();
    isPlaying = false;
    notifyListeners();
  }

  void stop() async {
    await _player.stop();
    isPlaying = false;
    notifyListeners();
  }

  void rewind() async {
    Duration newPosition = currentPosition - const Duration(seconds: 10);
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    }
    await _player.seek(newPosition);
  }

  void fastForward() async {
    Duration newPosition = currentPosition + const Duration(seconds: 10);
    if (newPosition > totalDuration) {
      newPosition = totalDuration;
    }
    await _player.seek(newPosition);
  }

  void seekTo(Duration position) async {
    await _player.seek(position);
  }

  Duration get position => currentPosition;
  Duration get duration => totalDuration;

  bool get isAudioPlaying => isPlaying;

  void disposePlayer() {
    _player.dispose();
    super.dispose();
  }
}
