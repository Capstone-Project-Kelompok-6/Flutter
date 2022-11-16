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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Just For You',
                style: TextStyle(
                  color: fontGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    featureCard(yellow, 'Membership',
                        'Practice Anytime Anywhere at any Gym', 'Upgrade'),
                    const SizedBox(width: 10),
                    featureCard(violet, 'Populer Article',
                        'Hundreds of articles & healthy recipes', 'Read More'),
                    const SizedBox(width: 10),
                    featureCard(orange, 'Workout Video',
                        'Watching Anytime Anywhere at Home', 'Watch More'),
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
                  color: white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 140,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
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
}
