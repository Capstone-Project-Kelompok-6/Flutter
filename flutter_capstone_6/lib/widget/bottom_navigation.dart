import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/explore/explore_screen.dart';
import 'package:flutter_capstone_6/screen/main/profile/profile_screen.dart';
import 'package:flutter_capstone_6/screen/main/summary/summary_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/main/home/home_screen.dart';

class BottomNavigationBarController extends StatefulWidget {
  const BottomNavigationBarController({Key? key, required this.token})
      : super(key: key);

  final String token;
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  late final List<Widget> pages = [
    HomeScreen(
      key: const PageStorageKey('Page1'),
      token: widget.token,
    ),
    const ExploreScreen(
      key: PageStorageKey('Page2'),
    ),
    const SummaryScreen(
      key: PageStorageKey('Page3'),
    ),
    const ProfileScreen(
      key: PageStorageKey('Page4'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => Container(
        height: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: BottomNavigationBar(
            backgroundColor: white,
            onTap: (int index) => setState(() => _selectedIndex = index),
            currentIndex: selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: bottomNavbarItem('assets/home.svg'),
                  icon: bottomNavbarItem('assets/home_unselect.svg'),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: bottomNavbarItem('assets/explore.svg'),
                  icon: bottomNavbarItem('assets/explore_unselect.svg'),
                  label: 'Explore'),
              BottomNavigationBarItem(
                  activeIcon: bottomNavbarItem('assets/summary.svg'),
                  icon: bottomNavbarItem('assets/summary_unselect.svg'),
                  label: 'Summary'),
              BottomNavigationBarItem(
                activeIcon: bottomNavbarItem('assets/user.svg'),
                icon: bottomNavbarItem('assets/user_unselect.svg'),
                label: 'Profile',
              ),
            ],
            selectedLabelStyle:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(color: n40),
            selectedItemColor: violet,
            unselectedItemColor: n40,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          ),
        ),
      );

  Widget bottomNavbarItem(String assets) {
    return SizedBox(
      height: 24,
      width: 24,
      child: SvgPicture.asset(assets),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
