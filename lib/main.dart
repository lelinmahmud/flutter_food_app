import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:random_app/constants/constants.dart';
import 'package:random_app/pages/first_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    title: "Random app",
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));

}

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _selectedTab = _SelectedTab.home;
  final PageController _pageController=PageController();
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Image.asset(Constants.AsetsImage+"chef.png",height: 20,width: 20,),
            title: Text("Recipes"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Image.asset(Constants.AsetsImage+"speech.png",height: 20,width: 20,),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Image.asset(Constants.AsetsImage+"user.png",height: 20,width: 20,),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FirstPage()
        ],
      ),
    );
  }
}

enum _SelectedTab { home, likes, search, profile }



