import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryDetails extends StatelessWidget {
  final String countryName;
  final int countryCases;
  final int countryDeaths;
  // final int countryRecovered;
  final int todayCases;
  final int todayDeaths;
  final int activeCases;
  final int critCases;
  final int totalTests;

  CountryDetails(
      {this.activeCases,
      this.critCases,
      this.totalTests,
      this.todayCases,
      this.todayDeaths,
      this.countryName,
      this.countryCases,
      this.countryDeaths,
      // this.countryRecovered
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

      backgroundColor: Colors.white60,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
    ),
    body: Column(
      children: [
          DetailCard(
                  heading: "Total Cases",
                  iconColor: Colors.green,
                  icon: FontAwesomeIcons.infoCircle,
                  info: countryCases,
                ),
        DetailCard(
                  heading: "Total Deaths",
                  iconColor: Colors.red[300],
                  icon: Icons.airline_seat_individual_suite,
                  info: countryDeaths,
                ),
                DetailCard(
                  heading: "Today Cases",
                  info: todayCases,
                  icon: Icons.assignment,
                  iconColor: Colors.blue,
                ),
                DetailCard(
                  heading: "Today Deaths",
                  info: todayDeaths,
                  icon: Icons.airline_seat_individual_suite,
                  iconColor: Colors.red[300],
                ),
                DetailCard(
                  heading: "Total Tests",
                  info: totalTests,
                  icon: Icons.colorize,
                  iconColor: Colors.amber,
                ),
                DetailCard(
                  heading: "Active Cases",
                  info: activeCases,
                  icon: Icons.add_circle,
                  iconColor: Colors.blueGrey,
                )
      ],
    )
    );
  }
}


class DetailCard extends StatelessWidget {
  final int info ; 
  final String heading ; 
  final IconData icon ; 
  final Color iconColor ;

  const DetailCard({Key key, this.info, this.heading, this.icon, this.iconColor}) : super(key: key); 

  
  // const DetailCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          title: Text('${info}',style: TextStyle(fontFamily: 'MyFont'),),
          subtitle: Text('${heading}',style: TextStyle(fontFamily: 'MyFont')),
          trailing: Icon(icon,color: iconColor,size: 35.0,),
        ),
      ),
    );
  }
}

