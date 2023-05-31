import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  final player = AudioCache();

  AudioManager() {
    player.load('assets/fatalitysound.mp3');
  }

  void playGameOverSound() {
    player.play('assets/fatalitysound.mp3');
  }
}
