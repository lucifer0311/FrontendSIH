import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioSpeechPlaying extends StatefulWidget {
  final String speechTitle;
  final String speechSpeaker;
  const AudioSpeechPlaying(
      {Key? key, required this.speechTitle, required this.speechSpeaker})
      : super(key: key);

  @override
  State<AudioSpeechPlaying> createState() => _AudioSpeechPlayingState();
}

class _AudioSpeechPlayingState extends State<AudioSpeechPlaying> {
  String transcript = "";
  String speech =
      "https://github.com/kaustubhpDev/FrontendSIH/blob/main/daemon/assets/audios/naidu.mpeg";

  @override
  void initState() {
    //Fetch the transcript and audio file from the server.
    setState(() {
      transcript =
          "My name is Mayur Mahajan. I am an app developer and web developer. I am creating this app in honor of our great leaders. If you are seeing this message then that means I haven't yet integrated backend into this app and this is why you have to read this very long hardcoded string that I could have simply copy pasted from somewhere but didbn't. Adios! My name is Mayur Mahajan. I am an app developer and web developer. I am creating this app in honor of our great leaders. If you are seeing this message then that means I haven't yet integrated backend into this app and this is why you have to read this very long hardcoded string that I could have simply copy pasted from somewhere but didbn't. Adios!";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.speechSpeaker),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AudioSpeechScript(transcript: transcript),
              const SizedBox(
                height: 12,
              ),
              AudioSpeechTitle(
                speaker: widget.speechSpeaker,
                title: widget.speechTitle,
              ),
              const SizedBox(
                height: 12,
              ),
              AudioSpeechAudio(speech: speech)
            ],
          ),
        ));
  }
}

class AudioSpeechAudio extends StatefulWidget {
  final String speech;
  const AudioSpeechAudio({Key? key, required this.speech}) : super(key: key);

  @override
  State<AudioSpeechAudio> createState() => _AudioSpeechAudioState();
}

class _AudioSpeechAudioState extends State<AudioSpeechAudio> {
  AudioPlayer player = AudioPlayer();

  bool isAudioLoaded = false;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setSpeechSource();
    super.initState();

    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
        isAudioLoaded = true;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> setSpeechSource() async {
    await player.setSourceUrl(
        'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return isAudioLoaded
        ? Column(
            children: [
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      formatTime(duration),
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        setState(() {
                          isPlaying = false;
                        });
                        await player.pause();
                      } else {
                        setState(() {
                          isPlaying = true;
                        });
                        await player.resume();
                      }
                    },
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle
                          : Icons.play_arrow_outlined,
                      size: 32,
                    )),
              )
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}

String formatTime(Duration time) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(time.inHours);
  final minutes = twoDigits(time.inMinutes.remainder(60));
  final seconds = twoDigits(time.inSeconds.remainder(60));

  return [
    if (time.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}

class AudioSpeechScript extends StatelessWidget {
  final String transcript;
  const AudioSpeechScript({Key? key, required this.transcript})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary
                ]),
            borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(transcript,
              softWrap: true, style: Theme.of(context).textTheme.bodyText2),
        )),
      ),
    );
  }
}

class AudioSpeechTitle extends StatefulWidget {
  final String title;
  final String speaker;
  const AudioSpeechTitle({Key? key, required this.title, required this.speaker})
      : super(key: key);

  @override
  State<AudioSpeechTitle> createState() => _AudioSpeechTitleState();
}

class _AudioSpeechTitleState extends State<AudioSpeechTitle> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.speaker,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          isLiked = false;
                        } else {
                          isLiked = true;
                        }
                      });
                    },
                    icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
