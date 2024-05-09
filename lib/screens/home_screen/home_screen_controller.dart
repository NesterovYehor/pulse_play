import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier{
  bool isPlaying = false;
  late Timer _timer;
  int _secondsElapsed = 0;
  bool _isTimerRunning = false;

  int get secondsElapsed => _secondsElapsed;

  bool get isTimerRunning => _isTimerRunning;


  void toggleTimer() {
    if (isPlaying){
      pauseTimer();
      resetTimer();
    }else{
      startTimer();
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsElapsed++;
      notifyListeners();
    });
    _isTimerRunning = true;
    notifyListeners();
  }

  void pauseTimer() {
    _timer.cancel();
    _isTimerRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer.cancel();
    _secondsElapsed = 0;
    _isTimerRunning = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
