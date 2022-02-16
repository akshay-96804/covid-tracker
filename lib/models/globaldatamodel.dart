// import 'package:flutter/foundation.dart';

class GlobalModel{
  final String cases ; 
  final String deaths ; 
  final String recovered ; 

  GlobalModel({this.cases,this.deaths,this.recovered});

   factory GlobalModel.fromJSON(Map<String,dynamic> json){
    return GlobalModel(
      cases: json['cases'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString()
    );
  }

 
}