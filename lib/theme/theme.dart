import 'dart:ui';

import 'package:flutter/material.dart';

const Color primaryclr = Color.fromARGB(255, 69, 115, 223);
const Color darkGreyClr = Color (0xFF121212);
const Color whiteClr = const Color(0xFFeeedf2);

class Themes{
  static final light = ThemeData(
    primaryColor: primaryclr,
    brightness: Brightness.light, 
    colorScheme: const ColorScheme.light(
      background: whiteClr
    )
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: darkGreyClr
    ),
  );
}
