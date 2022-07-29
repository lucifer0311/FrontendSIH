import 'package:flutter/material.dart';
import 'screens/auth_screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const Signup(),
      debugShowCheckedModeBanner: false,
    );
  }
}
