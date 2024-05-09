import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_play/components/play_pause_button.dart';
import 'package:pulse_play/components/timer_display.dart';
import 'package:pulse_play/screens/home_screen/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<HomeScreenController>(
          builder: (context, controller, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerWidget(secondsElapsed: controller.secondsElapsed,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              PlayPauseButton(isPlaying: controller.isPlaying, onPressed: () => controller.toggleTimer(),),
            ],
          ),
        ),
      ),
    );
  }
}
