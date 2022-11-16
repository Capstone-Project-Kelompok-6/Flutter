import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/explore_screen.dart';
import 'package:flutter_capstone_6/screen/profile_screen.dart';
import 'package:flutter_capstone_6/screen/summary_screen.dart';

import '../screen/home_sreen.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('Page1'),
    ),
    ExploreScreen(
      key: PageStorageKey('Page2'),
    ),
    SummaryScreen(
      key: PageStorageKey('Page3'),
    ),
    ProfileScreen(
      key: PageStorageKey('Page4'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.summarize), label: 'Summary'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
