import 'package:daemon/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VideoDescription extends StatefulWidget {
  const VideoDescription({Key? key}) : super(key: key);

  @override
  State<VideoDescription> createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  String videoTitle = "Sarojini Naidu";
  String videoDetails =
      "Sarojini Naidu was an Indian political activist and poet. A proponent of civil rights, women's emancipation, and anti-imperialistic ideas, she was an important person in India's struggle for independence from colonial rule";
  final titleStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);
  final detailsStyle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(
                          'assets/thumbnail.webp',
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          videoTitle,
                          style: titleStyle,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "1880 - 1967",
                          style: detailsStyle,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  videoDetails,
                  style: detailsStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Speeches",
                  style: titleStyle,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
        ));
  }
}
