// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/home/children/chronometer/chronometer.dart';
import 'package:sampleproject/screens/home/children/help/help.dart';
import 'package:sampleproject/screens/home/children/map/map.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  PageController _pageConroller = PageController(initialPage: 1);
  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.location_on, color: secondaryColor), label: "Map"),
    BottomNavigationBarItem(
        icon: Icon(Icons.home, color: secondaryColor), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.help, color: secondaryColor), label: "Help"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _pageConroller,
            onPageChanged: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            children: [
              MapScreen(),
              ChronometerScreen(),
              HelpScreen(),
            ]),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(43, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                currentIndex: _currentIndex,
                items: _bottomNavigationBarItems,
                onTap: (index) {
                  setState(() {
                    _pageConroller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
                selectedItemColor: primaryColor,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));
  }
}
