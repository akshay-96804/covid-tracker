import 'package:covid_tracker/controller/covidAPI.dart';
import 'package:covid_tracker/customWidgets/globalListTile.dart';
import 'package:covid_tracker/customWidgets/virusIcon.dart';
import 'package:covid_tracker/models/globaldatamodel.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:intl/intl.dart';

class GlobalPage extends StatefulWidget {
  // const GlobalPage({ Key? key }) : super(key: key);

  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ; 
    double width = MediaQuery.of(context).size.width ; 

    return Container(
      margin: EdgeInsets.symmetric(vertical: height*0.04),
       padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.02),
      height: height*0.57,
      width: width,
      child: Column(
        children: [
          Text(
            "\tGlobal COVID-19",
            style: TextStyle(
                fontSize: height * 0.04,
                fontWeight: FontWeight.w200,
                fontFamily: 'MyFont'),
          ),
          CaseTile()
        ],
      )
    );
  }
}

class CaseTile extends StatelessWidget {
  
  // const CaseTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ; 
    double width = MediaQuery.of(context).size.width ;

    return Container(
      child: FutureBuilder<GlobalModel>(
            future: CovidAPI().getCase(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      GlobalListTile(
                        infoHeader: 'Cases',
                        stats: snapshot.data.cases,
                        color: Colors.blueAccent.withAlpha(200),
                        img: 'images/covidBlue.png',
                      ),
                      GlobalListTile(
                        infoHeader: 'Deaths',
                        stats: snapshot.data.deaths,
                        color: Colors.red.withAlpha(200),
                        img: 'images/death.png',
                      ),
                      GlobalListTile(
                        infoHeader: 'Recoveries',
                        stats: snapshot.data.recovered,
                        color: Colors.green.withAlpha(200),
                        img: 'images/recover.png',
                      )
                    ],
                  ),
                );
              }
              else if(snapshot.hasError){
                 print('Error Occurred');
              }
              return VirusLoader();
            },
      ),
    );
  }
}


