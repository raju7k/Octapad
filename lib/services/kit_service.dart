import '../models/drum_kit.dart';
import '../models/pad.dart';

class KitService {
  DrumKit jazzKit() {
    return DrumKit(
      name: 'Jazz Kit',
      pads: [
        Pad(id: 1, name: 'Kick', soundFile: 'kick.wav'),
        Pad(id: 2, name: 'Snare', soundFile: 'snare.wav'),
        Pad(id: 3, name: 'HiHat', soundFile: 'hihat.wav'),
        Pad(id: 4, name: 'Crash', soundFile: 'crash.wav'),
        Pad(id: 5, name: 'Tom1', soundFile: 'tom1.wav'),
        Pad(id: 6, name: 'Tom2', soundFile: 'tom2.wav'),
        Pad(id: 7, name: 'Ride', soundFile: 'ride.wav'),
        Pad(id: 8, name: 'FX', soundFile: 'clap.wav'),
      ],
    );
  }

  DrumKit rockKit() {
    return DrumKit(
      name: 'Rock Kit',
      pads: [
        Pad(id: 1, name: 'Kick', soundFile: 'kick.wav'),
        Pad(id: 2, name: 'Snare', soundFile: 'snare.wav'),
        Pad(id: 3, name: 'HiHat', soundFile: 'hihat.wav'),
        Pad(id: 4, name: 'Tom1', soundFile: 'tom1.wav'),
        Pad(id: 5, name: 'Tom2', soundFile: 'tom2.wav'),
        Pad(id: 6, name: 'Tom3', soundFile: 'tom3.wav'),
        Pad(id: 7, name: 'Crash', soundFile: 'crash.wav'),
        Pad(id: 8, name: 'Ride', soundFile: 'ride.wav'),
      ],
    );
  }

  DrumKit edmKit() {
    return DrumKit(
      name: 'EDM Kit',
      pads: [
        Pad(id: 1, name: 'Kick', soundFile: 'kick.wav'),
        Pad(id: 2, name: 'Clap', soundFile: 'clap.wav'),
        Pad(id: 3, name: 'Perc1', soundFile: 'hihat.wav'),
        Pad(id: 4, name: 'Perc2', soundFile: 'snare.wav'),
        Pad(id: 5, name: 'FX1', soundFile: 'tom1.wav'),
        Pad(id: 6, name: 'FX2', soundFile: 'tom2.wav'),
        Pad(id: 7, name: 'Crash', soundFile: 'crash.wav'),
        Pad(id: 8, name: 'Cymbal', soundFile: 'ride.wav'),
      ],
    );
  }

  List<DrumKit> getAllKits() {
    return [jazzKit(), rockKit(), edmKit()];
  }
}
