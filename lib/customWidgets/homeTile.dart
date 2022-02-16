import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {

  final int caseCount ; 
  final String heading ; 
  final Color tileColor ; 

  HomeTile({this.caseCount,this.heading,this.tileColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 4.0
      ),
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          height: height*0.14,
          width: width*0.45,
          color: tileColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
          "COVID-19",
          style: TextStyle(
              fontFamily: 'MyFont',
              color: Colors.white,
              // fontSize: height * 0.015
              ),
            ),
            Text("Total $heading",
            style: TextStyle(
                fontFamily: 'MyFont',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // fontSize: height * 0.02
                )
                ),
             Text("$caseCount",
            style: TextStyle(
                color: Colors.white,
                // fontSize: height * 0.025,
                fontFamily: 'MyFont'))   
            ],
          )
        ),
    );
  }
}