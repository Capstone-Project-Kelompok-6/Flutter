import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/register/register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List index = ['1', '2', '3'];
  List title = [
    'Ready to start your fitness journey',
    'Booking our class',
    'Get Burn',
  ];
  List subtitle = [
    'Work Fit will bring you access to many features with a single membership only',
    'Get a various interesting features from unlimited access to watch videos and being able to choose the instructor as you wish',
    "Let's exercise with us, we will help you to burn your fat",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Section
              CarouselSlider(
                options: CarouselOptions(
                  height: 631,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
                items: [0, 1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.only(top: 60),
                        decoration: const BoxDecoration(color: violet),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 327,
                              height: 327,
                              child: SvgPicture.asset(
                                  'assets/onboarding/onboarding_${index[i]}.svg'),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: 200,
                              height: 60,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  title[i],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 330,
                              height: 55,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  subtitle[i],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: n5,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 73),
                            i == 0
                                ? SvgPicture.asset(
                                    'assets/onboarding/bar_${index[0]}.svg')
                                : i == 1
                                    ? SvgPicture.asset(
                                        'assets/onboarding/bar_${index[1]}.svg')
                                    : i == 2
                                        ? SvgPicture.asset(
                                            'assets/onboarding/bar_${index[2]}.svg')
                                        : Container(),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // Register Membership Section
              Container(
                margin: const EdgeInsets.only(
                    right: 25, left: 25, top: 44, bottom: 24),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Get a Free Membership",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: violet,
                    ),
                  ),
                ),
              ),

              // Goto Login Section
              Container(
                margin: const EdgeInsets.only(bottom: 58),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: n20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
