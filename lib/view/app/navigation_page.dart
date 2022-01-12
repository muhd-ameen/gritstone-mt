// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerceapiqa/view/app/Home/home_screen.dart';
import 'package:ecommerceapiqa/view/constants/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: "",
              activeIcon: Icon(CupertinoIcons.home, color: kPrimaryColor),
              icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: "",
              activeIcon: Icon(Icons.list_alt_outlined, color: kPrimaryColor),
              icon: Icon(Icons.list_alt_outlined)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.local_mall_outlined)),
          BottomNavigationBarItem(
            label: "",
            activeIcon: Icon(Icons.person_outlined,
                color: kPrimaryColor),
            icon: Icon(Icons.person_outlined),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
