import 'package:covid_tracker/controller/covidAPI.dart';
import 'package:covid_tracker/customWidgets/virusIcon.dart';
import 'package:covid_tracker/models/countrydatamodel.dart';
import 'package:covid_tracker/screens/countryDetails.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  // const Countries({ Key? key }) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {

  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ; 
    double width = MediaQuery.of(context).size.width ;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: FutureBuilder<CountryDataList>(
            future: CovidAPI().getCountryList(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.02,
                    vertical: height*0.02
                  ),
                  itemCount: snapshot.data.countries.length,
                  itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data.countries[index].countryName),
                      subtitle: Text('${snapshot.data.countries[index].countryCases}'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return CountryDetails(
                              activeCases: snapshot.data.countries[index].activeCases,
                              countryCases: snapshot.data.countries[index].countryCases,
                              countryDeaths: snapshot.data.countries[index].countryDeaths,
                              countryName: snapshot.data.countries[index].countryName,
                              // countryRecovered: snapshot.data.countries[index].countryRecovered,
                              critCases: snapshot.data.countries[index].critCases,
                              todayCases: snapshot.data.countries[index].todayCases,
                              todayDeaths: snapshot.data.countries[index].todayDeaths,
                              totalTests: snapshot.data.countries[index].totalTests,
                            );
                          }
                        ));
                      },
                    ),
                  );
                });
              }
              else if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error),
                );
              }
              else{
                return VirusLoader();
              } 
            },
            
          ),
        ),
      ),
    );
  }
}