import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/explore_screen.dart';
import 'package:flutter_capstone_6/screen/profile_screen.dart';
import 'package:flutter_capstone_6/screen/summary_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Widget _bottomNavigationBar(int selectedIndex) => Container(
        height: 116,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: BottomNavigationBar(
            onTap: (int index) => setState(() => _selectedIndex = index),
            currentIndex: selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/home.svg'),
                  ),
                  icon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/home_unselect.svg'),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/explore.svg'),
                  ),
                  icon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/explore_unselect.svg'),
                  ),
                  label: 'Explore'),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/summary.svg'),
                  ),
                  icon: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/summary_unselect.svg'),
                  ),
                  label: 'Summary'),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset('assets/user.svg'),
                ),
                icon: Container(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset('assets/user_unselect.svg'),
                ),
                label: 'Profile',
              ),
            ],
            selectedLabelStyle:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            selectedItemColor: Color.fromRGBO(73, 87, 204, 1),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 14,
          ),
        ),
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
