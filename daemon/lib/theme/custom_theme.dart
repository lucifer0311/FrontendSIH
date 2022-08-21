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
          onSurface: CustomColors.onBackground),
      textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: CustomColors.onBackground,
          ),
          headline4: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: CustomColors.onBackground,
          ),
          bodyText1: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          bodyText2: const TextStyle(
              fontSize: 20,
              height: 1.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              overflow: TextOverflow.clip)));

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
          onSurface: CustomColors.onBackground),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          bodyText2: TextStyle(
              fontSize: 20,
              height: 1.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              overflow: TextOverflow.clip)));
}
