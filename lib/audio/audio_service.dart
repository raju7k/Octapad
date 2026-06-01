import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer player = AudioPlayer();

  Future<void> play(String sound) async {
    await player.stop(); // ensures no overlap delay
    await player.play(AssetSource('sounds/$sound.wav'));
  }
}