import 'package:flutter/material.dart';
import 'package:daemon/theme/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

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
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: CustomColors.coral,
        ),
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
                SearchBar(controller: controller),
                largeSpacing,
                const Text(
                  "Speeches Of the Month",
                  style: headingStyle,
                ),
                smallSpacing,
                const SpeechGallery(
                  speechList: ["Nehru", "Gandhi", "Naidu"],
                ),
                largeSpacing,
                const Text(
                  "Best of ",
                  style: headingStyle,
                ),
                smallSpacing,
                const LeadersGallery(
                    leaderList: ["Vivekanand", "Kalam", "Patel"]),
              ],
            ),
          ),
        ));
  }
}

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  const SearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.8,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey.shade700),
              hintText: "Search",
              fillColor: Colors.white),
        ),
      ),
      IconButton(
          onPressed: () {
            setState(() {
              widget.controller.text = "";
            });
          },
          icon: const Icon(Icons.clear, size: 32, color: Colors.grey)),
      IconButton(
          onPressed: () {
            print("Search Value : ${widget.controller.text}");
          },
          icon: Icon(Icons.search, size: 32, color: CustomColors.babyPink)),
    ]);
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
