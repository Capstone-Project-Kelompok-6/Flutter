import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';

import '../widget/appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: const BoxDecoration(
            color: whiteBg,
          ),
          child: const AppBarContent(),
        ),
      ),
      body: Container(),
    );
  }
}
