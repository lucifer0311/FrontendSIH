import 'package:flutter/material.dart';

class CustomColors {
  static Color coral = const Color(0xFFFEBF80);
  static Color babyPink = const Color(0xFFFF8B92);
  static Color errorColor = const Color.fromARGB(255, 249, 75, 87);

  //onErrorColor is color for foreground of the error, so needs to contrast errorColor
  static Color onErrorColor = const Color.fromARGB(255, 10, 4, 4);

  //background color is color that appears behind scrollable widgets
  static Color background = const Color.fromARGB(255, 254, 223, 223);

  static Color onBackground = const Color(0xFF112A46);
}
