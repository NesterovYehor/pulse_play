import 'package:flutter/material.dart';
import 'package:pulse_play/theme/theme.dart';

class TimerWidget extends StatelessWidget {
  final int secondsElapsed;

  const TimerWidget({Key? key, required this.secondsElapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hours = secondsElapsed ~/ 3600;
    final minutes = (secondsElapsed ~/ 60) % 60;
    final seconds = secondsElapsed % 60;

    final timerText =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: darkGreyClr),
    );
  }
}
