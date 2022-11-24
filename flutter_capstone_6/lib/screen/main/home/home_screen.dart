import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/appbar_home.dart';

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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Just For You Section
              const SizedBox(height: 5),
              const Text(
                'Just For You',
                style: TextStyle(
                    color: fontGrey, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    featureCard(yellow, 'Membership',
                        'Practice Anytime Anywhere at any Gym', 'Upgrade'),
                    const SizedBox(width: 15),
                    featureCard(violet, 'Populer Article',
                        'Hundreds of articles & healthy recipes', 'Read More'),
                    const SizedBox(width: 15),
                    featureCard(orange, 'Workout Video',
                        'Watching Anytime Anywhere at Home', 'Watch More'),
                  ],
                ),
              ),

              // Our Features Button Section
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: n40.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        featureIconBtn(
                            violet, 'Booking Class', 'assets/book.svg'),
                        featureIconBtn(orange, 'Multiple Gym Booking',
                            'assets/location.svg'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        featureIconBtn(
                            violet, 'Our Features', 'assets/apps.svg'),
                        featureIconBtn(white, '', 'assets/book.svg'),
                      ],
                    ),
                  ],
                ),
              ),

              // Recommendation Class Section
              const SizedBox(height: 5),
              const Text(
                'Recommendation Class',
                style: TextStyle(
                    color: fontGrey, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    recommendClassCard('Yoga Class 101'),
                    const SizedBox(width: 20),
                    recommendClassCard('Muscle Builder 101'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureCard(
      Color color, String title, String subtitle, String btnTitle) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 140,
                child: Text(
                  subtitle,
                  style: const TextStyle(color: white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 135,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: btnBlack,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Text(
                    btnTitle,
                    style: const TextStyle(
                      color: white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          SizedBox(
              width: 99,
              height: 125,
              child: Image.asset(
                'assets/illus1.png',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

  Widget featureIconBtn(Color color, String title, String icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(13),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: SvgPicture.asset(icon),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 90,
          child: Text(
            title,
            style: const TextStyle(
              color: fontBlack,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget recommendClassCard(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: softBlue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: fontGrey, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            height: 90,
            child: Image.asset(
              'assets/yoga.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: btnBlack,
            ),
            child: MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: const Text(
                'Join Class',
                style: TextStyle(
                  color: white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
