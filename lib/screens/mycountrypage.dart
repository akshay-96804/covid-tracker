import 'package:covid_tracker/controller/covidAPI.dart';
import 'package:covid_tracker/customWidgets/homeTile.dart';
import 'package:covid_tracker/customWidgets/virusIcon.dart';
import 'package:covid_tracker/models/homeCountryDataModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCountryPage extends StatefulWidget {
  // const HomeCountryPage({ Key? key }) : super(key: key);

  @override
  _HomeCountryPageState createState() => _HomeCountryPageState();
}

class _HomeCountryPageState extends State<HomeCountryPage> {
  
  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(dateTime);

    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;  
     return Container(
       padding: EdgeInsets.all(8.0),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flag(),
          FutureBuilder<HomeStats>(
            future: CovidAPI().getHomeCase(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Last Updated',style: TextStyle(
                                fontFamily: 'MyFont',
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w600),),
                        SizedBox(
                            width: width * 0.02,
                          ),
                          Text('${formattedDate}',style: TextStyle(
                                fontFamily: 'MyFont',
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w600),),
                          SizedBox(
                            width: width * 0.02,
                          ),
                       GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Icon(Icons.refresh))         
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeTile(
                          caseCount: snapshot.data.cases,
                          heading: 'Cases',
                          tileColor: Colors.blueAccent,
                        ),
                        HomeTile(
                           caseCount: snapshot.data.recovered,
                          heading: 'Recoveries',
                          tileColor: Colors.green,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeTile(
                           caseCount: snapshot.data.deaths,
                          heading: 'Deaths',
                          tileColor: Colors.redAccent,
                        ),
                        HomeTile(
                          caseCount: snapshot.data.todayCases,
                          heading: 'Today Cases',
                          tileColor: Colors.orangeAccent,
                        )
                      ],
                    ),
                    SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        "Stay Home, Save India!",
                        style: TextStyle(
                            fontFamily: 'MyFont', fontWeight: FontWeight.bold),
                      )
                  ],
                );
              }
              else if(snapshot.hasError){
                print('Error Occurred');
              }
              return VirusLoader();
            },
          )
        ],
    ),
     );
  }
}