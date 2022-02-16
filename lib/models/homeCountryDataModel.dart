class HomeStats{
  final int cases ;
  final int todayCases ; 
  final int deaths ; 
  final int recovered ; 
  final int active ; 
  // final String latestUpdated ; 

  HomeStats({this.cases,this.todayCases, this.deaths, this.recovered, this.active});

  factory HomeStats.fromJSON(Map<String,dynamic> json) {
    return HomeStats(
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      // latestUpdated: json['lastUpdatedAtApify']
    );
  } 

}