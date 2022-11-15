import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone Kelompok 6',
      home: HomeScreen(),
    );
  }
}
