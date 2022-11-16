import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/screen/home_sreen.dart';
import 'package:flutter_capstone_6/widget/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationBarController()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'HALO INI SPLASHSCREEN',
            style: TextStyle(fontSize: 30),
          )
        ],
      )),
    );
  }
}
