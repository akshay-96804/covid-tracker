import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  // const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ; 
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('DEVELOPER',style: TextStyle(fontFamily: 'MyFont',fontSize: height * 0.04),),
          SizedBox(
            height: height*0.03,
          ),
          CircleAvatar(
            maxRadius: height*0.123,
            backgroundColor: Colors.orangeAccent,
            child: CircleAvatar(
              maxRadius: height*0.12,
              backgroundImage: AssetImage('images/profile_pic.jpg'),
            ),
          ),
          SizedBox(
            height: height*0.02,
          ),
          Text('AKSHAY BABEL',style: TextStyle(fontFamily: 'MyFont',fontWeight: FontWeight.bold,fontSize: height * 0.034)),
          SizedBox(
            height: height*0.03,
          ),
          Text('Flutter Developer',style: TextStyle(fontFamily: 'MyFont',fontWeight: FontWeight.bold,fontSize: height * 0.029)),
          SizedBox(
            height: height*0.03,
          ),
          Text('Email Me',style: TextStyle(fontFamily: 'MyFont',fontWeight: FontWeight.bold,fontSize: height * 0.025)),
          SizedBox(
            height: height*0.01,
          ),
          Text('19uec032@lnmiit.ac.in',style: TextStyle(fontFamily: 'MyFont',fontSize: height * 0.020)),
        ],
      )
    );
  }
}