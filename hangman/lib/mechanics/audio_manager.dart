import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  final player = AudioCache();

  AudioManager() {
    player.load('fatalitysound.mp3');
    player.load('audio/winner.mp3');
  }

  void playGameOverSound() {
    player.play('fatalitysound.mp3');
  }

  void playWinnerSound() {
    player.play('audio/winner.mp3');
  }
}
