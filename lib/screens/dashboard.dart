import 'package:covid_tracker/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'allcountries.dart';
import 'globalpage.dart';
import 'mycountrypage.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

PageController _pageController = PageController(
  initialPage: 0,
);

List<Widget> mypages = [
  GlobalPage(),
  HomeCountryPage(),
  Countries(),
  Profile()
] ;


class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0 ;
  int _currentPage = 0  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: mypages.length,
        onPageChanged: (page){
            setState(() {
              _selectedIndex = page ;
              _currentPage = page ;            
              });
        },
        controller: _pageController,
        itemBuilder: (context,page){
        return mypages[_currentPage] ;
      }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index){
          setState(() {
            _selectedIndex = index ;
            _currentPage = index ; 
              });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Global',
            icon: Icon(FontAwesomeIcons.globe,)
          ),
          BottomNavigationBarItem(
            label: 'My Country',
            icon: Icon(FontAwesomeIcons.star)
          ),
          BottomNavigationBarItem(
            label: 'Countries',
            icon: Icon(FontAwesomeIcons.flag)
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: Icon(FontAwesomeIcons.personBooth)
          ),
        ],
      ),
    );
  }
}