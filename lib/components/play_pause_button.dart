import 'package:flutter/material.dart';
import 'package:pulse_play/theme/theme.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key, required this.isPlaying, required this.onPressed}) : super(key: key);

  final bool isPlaying;
  final VoidCallback onPressed;

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    if (!widget.isPlaying) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.5, end: 1.7).animate(_animationController),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero, 
          backgroundColor: primaryclr,
          elevation: 8,
          shadowColor: primaryclr.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0), 
          child: Center(
            child: Icon(
              widget.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant PlayPauseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _animationController.stop();
      } else {
        _animationController.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
