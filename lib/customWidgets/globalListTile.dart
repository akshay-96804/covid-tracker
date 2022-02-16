import 'package:flutter/material.dart';

class GlobalListTile extends StatelessWidget {
  String infoHeader ; 
  String stats ; 
  String img ; 
  Color color ; 

  GlobalListTile({this.infoHeader,this.color,this.stats,this.img});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width;

    return Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          height: height*0.14,
          width: width,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Global',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'MyFont'),
                  ),
                  Text('Total ${infoHeader}',style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'MyFont'),
                  ),
                  Text(stats,style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'MyFont'),
                  ),
                ],
              ),
              Opacity(opacity: 0.5,
              child: Image.asset(img))
            ],
          ),
        ),
    );
  }
}