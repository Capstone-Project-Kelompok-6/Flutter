import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';

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
      body: Column(children: [Center(child: Text('Halooo Home'))]),
    );
  }
}
