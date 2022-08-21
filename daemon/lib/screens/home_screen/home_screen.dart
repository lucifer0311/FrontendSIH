import 'package:daemon/screens/speech_description/speech_description.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:daemon/theme/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Jawaharlal Nehru',
    'Mahatma Gandhi',
    'Sarojini Naidu',
    'Dr. Abdul Kalam',
    'Swami Vivekanand',
    'Atal Bihari Vajpayee',
    'Rajendra Prasad',
    'Sardar Patel',
    'Dr Babasaheb Ambedkar',
    'Chatrapati Shivaji Maharaj'
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 100));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    const largeSpacing = SizedBox(
      height: 40,
    );

    const smallSpacing = SizedBox(
      height: 20,
    );

    return Scaffold(
        appBar: EasySearchBar(
            title: const Text(''),
            onSearch: (value) => setState(() => searchValue = value),
            asyncSuggestions: (value) async => await _fetchSuggestions(value)),
        drawer: Drawer(
          backgroundColor: Colors.amber.shade200,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                largeSpacing,
                Text(
                  "Speeches Of the Month",
                  style: Theme.of(context).textTheme.headline2,
                ),
                smallSpacing,
                const SpeechGallery(
                  speechList: [
                    "patel.jpg",
                    "nehru.jpeg",
                    "ambedkar.jpg",
                    "gandhi.jpg",
                  ],
                ),
                largeSpacing,
                Text(
                  "Best of ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                smallSpacing,
                const LeadersGallery(leaderList: [
                  "thumbnail.webp",
                  "bose.jpg",
                  "vivekananda.png",
                  "tilak.webp"
                ]),
                largeSpacing,
                Text(
                  "Handpicked For You",
                  style: Theme.of(context).textTheme.headline2,
                ),
                smallSpacing,
                const SpeechGallery(
                  speechList: [
                    "patel.jpg",
                    "nehru.jpeg",
                    "ambedkar.jpg",
                    "gandhi.jpg",
                  ],
                ),
                largeSpacing,
              ],
            ),
          ),
        ));
  }
}

class SpeechGallery extends StatefulWidget {
  final List speechList;
  const SpeechGallery({Key? key, required this.speechList}) : super(key: key);

  @override
  State<SpeechGallery> createState() => _SpeechGalleryState();
}

class _SpeechGalleryState extends State<SpeechGallery> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.speechList
            .map((e) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpeechDescription()));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      color: CustomColors.coral,
                      height: 200,
                      width: 300,
                      child: Image.asset("assets/images/${e.toString()}"),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class LeadersGallery extends StatefulWidget {
  final List leaderList;
  const LeadersGallery({Key? key, required this.leaderList}) : super(key: key);

  @override
  State<LeadersGallery> createState() => _LeadersGalleryState();
}

class _LeadersGalleryState extends State<LeadersGallery> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.leaderList
            .map((e) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpeechDescription()));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          'assets/images/${e.toString()}',
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
