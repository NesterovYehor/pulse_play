import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_play/screens/core_screen.dart';
import 'package:pulse_play/screens/home_screen/home_screen_controller.dart';
import 'package:pulse_play/screens/second_screen/location_info_screen_controller.dart';
import 'package:pulse_play/screens/third_screen/third_screen_controller.dart';
import 'package:pulse_play/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenController>(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider<LocationInfoScreenController>(
          create: (context) =>LocationInfoScreenController()
        ),
        ChangeNotifierProvider<ThirdScreenController>(
          create: (context) =>ThirdScreenController()
        )
      ],
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        home: const CoreScreen(),
      ),
    );
  }
}