import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/main/profile/profile_providers.dart';
import 'package:flutter_capstone_6/screen/register/register_screen.dart';
import 'package:flutter_capstone_6/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: ProfileProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Capstone Kelompok 6',
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
          home: const RegisterScreen(),
        ));
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // text theme
//     final textTheme = Theme.of(context).textTheme;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Capstone Kelompok 6',
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(textTheme),
//       ),
//       home: const RegisterScreen(),
//     );
//   }
// }
