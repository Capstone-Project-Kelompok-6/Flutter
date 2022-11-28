import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Capstone Kelompok 6',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(textTheme),
        ),
        home: const SplashScreen());
  }
}
