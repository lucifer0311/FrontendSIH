import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
         backgroundColor: Color.fromARGB(255, 255, 150, 115),
         //Splash Screen container 
         body: Center(
          //Column of Widgets - Logo , Title
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children:const [
            //Splash Screen Logo
            Image(image: AssetImage('assets/logo.png'),),
            SizedBox(height: 10,),
            //Splash Screen Title Text
            Text("D A E M O N",
            style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.w900,
            fontFamily: 'Open Sans',
            fontSize: 50
          ),),
          
          ]
         ) 
        ),
      )
    );

  }
}