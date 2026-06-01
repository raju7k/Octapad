import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playSound(String file) async {
    try {
      await _player.play(
        AssetSource('sounds/$file'),
      );
    } catch (e) {
      print('Error playing sound: $e');
    }
  }
}
