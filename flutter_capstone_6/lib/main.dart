import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/home/notification_view_model.dart';
import 'package:flutter_capstone_6/screen/main/profile/edit_profile/image_view_model.dart';
import 'package:flutter_capstone_6/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel(),
          ),
          ChangeNotifierProvider<NotificationViewModel>(
            create: (context) => NotificationViewModel(),
          ),
          ChangeNotifierProvider<ImageProfileViewModel>(
            create: (context) => ImageProfileViewModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Capstone Kelompok 6',
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
          home: const SplashScreen(),
        ));
  }
}
