import 'package:covid_tracker/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        loaderColor: Colors.orange,
        loadingText: Text('Stay Home Stay Safe!!!',style: TextStyle(
          fontFamily: 'MyFont',
          fontWeight: FontWeight.bold),),
        imageBackground: AssetImage('images/covidNew.png'),
        seconds: 5,
        navigateAfterSeconds: Dashboard(),
      ),
    );
  }
}

