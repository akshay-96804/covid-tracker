import 'dart:convert';

import 'package:covid_tracker/models/countrydatamodel.dart';
import 'package:covid_tracker/models/globaldatamodel.dart';
import 'package:covid_tracker/models/homeCountryDataModel.dart';
import 'package:http/http.dart' as http;

class CovidAPI{
  Future<GlobalModel> getCase() async{
    var url =  Uri.parse('https://coronavirus-19-api.herokuapp.com/all') ;
    http.Response response  =await http.get(url);

    if(response.statusCode==200){
      return GlobalModel.fromJSON(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load post') ;
    } 
  }

  Future<HomeStats> getHomeCase() async{
    var url =  Uri.parse('https://disease.sh/v3/covid-19/countries/in') ;
    http.Response response  =await http.get(url);

    if(response.statusCode==200){
      return HomeStats.fromJSON(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load post') ;
    } 
  }

  Future<CountryDataList> getCountryList() async{
    var url = Uri.parse('https://coronavirus-19-api.herokuapp.com/countries');
    http.Response response = await http.get(url);

    if(response.statusCode==200){
      return CountryDataList.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed due To Network Error');
    }
  }
}