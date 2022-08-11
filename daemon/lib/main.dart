import 'package:flutter/material.dart';
import 'theme/custom_theme.dart';
import 'package:daemon/screens/video_description/video_description.dart';

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
      home: const VideoDescription(),
      debugShowCheckedModeBanner: false,
    );
  }
}
