import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff114B71);
  static const lightPrimaryColor = Color(0xffb8c9d3);
  static const lightPrimaryColorV2 = Color(0xff1b71aa);
  static const orange = Color(0xFFF15B28);
  static const green = Color(0xFF52C041);
  static const lightOrange = Color(0x20F15B28);
  static const lightBlack = Color(0x20000000);
  static const yellow = Color(0xFFFECE00);
  static const lightGray = Color(0xFFF0F3F8);
  static const lightGrayV2 = Color(0xFFF9F9FB);
  static const grey = Color(0xFF8F8F8F);
  static const mediumGrey = Color(0xFFC4C4C4);
  static const darkBlue = Color(0xFF114B71);
}

Map<int, Color> getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  /// if [500] is the default color, there are at LEAST five
  /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
  /// divisor of 5 would mean [50] is a lightness of 1.0 or
  /// a color of #ffffff. A value of six would be near white
  /// but not quite.
  final lowDivisor = 6;

  /// if [500] is the default color, there are at LEAST four
  /// steps above [500]. A divisor of 4 would mean [900] is
  /// a lightness of 0.0 or color of #000000
  final highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}
