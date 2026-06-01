import 'package:flutter/material.dart';

class ControlBar extends StatelessWidget {
  final VoidCallback onRecord;
  final VoidCallback onStop;
  final bool isRecording;

  const ControlBar({
    super.key,
    required this.onRecord,
    required this.onStop,
    this.isRecording = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: onRecord,
            icon: const Icon(Icons.mic),
            label: const Text('Record'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isRecording ? Colors.red : Colors.blueAccent,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onStop,
            icon: const Icon(Icons.stop),
            label: const Text('Stop'),
          ),
          Text(
            isRecording ? '● REC' : 'Ready',
            style: TextStyle(
              color: isRecording ? Colors.red : Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
