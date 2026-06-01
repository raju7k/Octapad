import 'package:flutter/material.dart';

class DrumPad extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const DrumPad({
    super.key,
    required this.title,
    required this.onTap,
    this.color = Colors.blueAccent,
  });

  @override
  State<DrumPad> createState() => _DrumPadState();
}

class _DrumPadState extends State<DrumPad> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    widget.onTap();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _isPressed = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      child: Card(
        elevation: _isPressed ? 2 : 6,
        color: _isPressed ? widget.color.withOpacity(0.7) : widget.color,
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
