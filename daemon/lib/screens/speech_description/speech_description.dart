import 'package:daemon/screens/speech_playing/speech_playing_video.dart';
import 'package:flutter/material.dart';

import '../speech_playing/speech_playing_audio.dart';

class SpeechDescription extends StatefulWidget {
  const SpeechDescription({Key? key}) : super(key: key);

  @override
  State<SpeechDescription> createState() => _SpeechDescriptionState();
}

class _SpeechDescriptionState extends State<SpeechDescription> {
  String speaker = "Sarojini Naidu";
  String videoDetails =
      "February 13, 1879, Hyderabad - March 2, 1949, Lucknow, Also known by the sobriquet Bharatiya Kokila (The Nightingale of India), was a child prodigy, freedom fighter, and poet. Naidu was the first Indian woman to become the President of the Indian National Congress and the first woman to become the Governor of Uttar Pradesh.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(
                          'assets/images/thumbnail.webp',
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          speaker,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          videoDetails,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Speeches",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 12,
                ),
                SpeechList(
                  speaker: speaker,
                ),
              ],
            ),
          ),
        ));
  }
}

class SpeechList extends StatefulWidget {
  final String speaker;
  const SpeechList({Key? key, required this.speaker}) : super(key: key);

  @override
  State<SpeechList> createState() => _SpeechListState();
}

class _SpeechListState extends State<SpeechList> {
  List speechListContents = [
    "Speech at Bombay Congress",
    "Speech at Lucknow Congress",
    "Speech at Calcutta Congress",
    "Speech at Colombo Law College",
    "Address to the children of Durban",
  ];

  void listenToSpeech(int index, BuildContext newContext) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (newContext) => AudioSpeechPlaying(
                speechTitle: speechListContents[index],
                speechSpeaker: widget.speaker)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: speechListContents.length * 75,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 8, left: 8, bottom: 10),
          child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoSpeechPlayingPage(
                                speechTitle: speechListContents[index],
                                speaker: widget.speaker)));
                  },
                  child: Container(
                    height: 50,
                    color: Colors.amber[(index * 100) + 100],
                    child: Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          speechListContents[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ))),
                        SizedBox(
                          width: 50,
                          child: Center(
                            child: IconButton(
                                icon: const Icon(
                                  Icons.headphones,
                                  size: 32,
                                ),
                                onPressed: () {
                                  listenToSpeech(index, context);
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, index) =>
                  const Divider(),
              itemCount: speechListContents.length),
        ));
  }
}
