import 'package:flutter/material.dart';
import '../models/drum_kit.dart';

class KitSelector extends StatelessWidget {
  final List<DrumKit> kits;
  final String selectedKitName;
  final Function(DrumKit) onKitSelected;

  const KitSelector({
    super.key,
    required this.kits,
    required this.selectedKitName,
    required this.onKitSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey[800],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kits.length,
        itemBuilder: (context, index) {
          final kit = kits[index];
          final isSelected = kit.name == selectedKitName;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () => onKitSelected(kit),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.green : Colors.grey[700],
              ),
              child: Text(
                kit.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
