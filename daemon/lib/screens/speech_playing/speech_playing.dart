import 'package:flutter/material.dart';

class SpeechPlayingPage extends StatefulWidget {
  final String speechTitle;
  final String speaker;
  const SpeechPlayingPage(
      {Key? key, required this.speechTitle, required this.speaker})
      : super(key: key);

  @override
  State<SpeechPlayingPage> createState() => _SpeechPlayingPageState();
}

class _SpeechPlayingPageState extends State<SpeechPlayingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(widget.speechTitle),
            const SizedBox(
              height: 24,
            ),
            Text(widget.speaker)
          ],
        ));
  }
}
