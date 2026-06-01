import 'package:flutter/material.dart';
import '../models/drum_kit.dart';
import '../services/audio_service.dart';
import '../services/kit_service.dart';
import '../services/recording_service.dart';
import '../widgets/drum_pad.dart';
import '../widgets/kit_selector.dart';
import '../widgets/control_bar.dart';
import '../utils/constants.dart';

class SpdHomeScreen extends StatefulWidget {
  const SpdHomeScreen({super.key});

  @override
  State<SpdHomeScreen> createState() => _SpdHomeScreenState();
}

class _SpdHomeScreenState extends State<SpdHomeScreen> {
  late AudioService _audioService;
  late KitService _kitService;
  late RecordingService _recordingService;
  late DrumKit _currentKit;
  late List<DrumKit> _allKits;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _audioService = AudioService();
    _kitService = KitService();
    _recordingService = RecordingService();
    _allKits = _kitService.getAllKits();
    _currentKit = _allKits[0];
  }

  void _playPad(int padIndex) {
    final pad = _currentKit.pads[padIndex];
    _audioService.playSound(pad.soundFile);
  }

  void _selectKit(DrumKit kit) {
    setState(() {
      _currentKit = kit;
    });
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
    });
    _recordingService.startRecording();
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    _recordingService.stopRecording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPD-30 Drum Machine'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          // Kit Header
          Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              border: Border(
                bottom: BorderSide(color: Colors.grey[700]!),
              ),
            ),
            child: Text(
              _currentKit.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // 8 Pads Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(
                  _currentKit.pads.length,
                  (index) => DrumPad(
                    title: _currentKit.pads[index].name,
                    onTap: () => _playPad(index),
                    color: padColors[index],
                  ),
                ),
              ),
            ),
          ),

          // Kit Selector
          KitSelector(
            kits: _allKits,
            selectedKitName: _currentKit.name,
            onKitSelected: _selectKit,
          ),

          // Control Bar
          ControlBar(
            onRecord: _startRecording,
            onStop: _stopRecording,
            isRecording: _isRecording,
          ),
        ],
      ),
    );
  }
}
