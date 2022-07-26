import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFEBF80), Color(0xFFFF8B92)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //Splash Screen container
        body: Center(
            //Column of Widgets - Logo , Title
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
              //Splash Screen Logo
              Image(
                image: AssetImage('assets/logo.png'),
              ),
              SizedBox(
                height: 10,
              ),
              //Splash Screen Title Text
              Text(
                "D A E M O N",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Open Sans',
                    fontSize: 50),
              ),
            ])),
      ),
    );
  }
}


// const Color.fromARGB(255, 255, 150, 115)