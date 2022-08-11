import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:daemon/theme/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
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

    const headingStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

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
              children: const [
                largeSpacing,
                Text(
                  "Speeches Of the Month",
                  style: headingStyle,
                ),
                smallSpacing,
                SpeechGallery(
                  speechList: ["Nehru", "Gandhi", "Naidu"],
                ),
                largeSpacing,
                Text(
                  "Best of ",
                  style: headingStyle,
                ),
                smallSpacing,
                LeadersGallery(leaderList: ["Vivekanand", "Kalam", "Patel"]),
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
            .map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    color: CustomColors.coral,
                    height: 200,
                    width: 300,
                    child: Text(e),
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
            .map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: CustomColors.babyPink),
                    height: 200,
                    width: 200,
                    child: Center(child: Text(e)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
