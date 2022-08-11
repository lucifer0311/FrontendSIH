import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.coral, foregroundColor: Colors.white),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: CustomColors.coral,
          onPrimary: CustomColors.coral,
          secondary: CustomColors.babyPink,
          onSecondary: CustomColors.babyPink,
          error: CustomColors.errorColor,
          onError: CustomColors.onErrorColor,
          background: CustomColors.background,
          onBackground: CustomColors.onBackground,
          surface: CustomColors.coral,
          onSurface: CustomColors.onBackground));

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: CustomColors.onBackground,
          onPrimary: CustomColors.onBackground,
          secondary: CustomColors.background,
          onSecondary: CustomColors.background,
          error: CustomColors.errorColor,
          onError: CustomColors.onErrorColor,
          background: CustomColors.background,
          onBackground: CustomColors.onBackground,
          surface: CustomColors.coral,
          onSurface: CustomColors.onBackground));
}
