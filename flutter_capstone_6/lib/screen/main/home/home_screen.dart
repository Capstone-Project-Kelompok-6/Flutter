import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/class_offline_data.dart';
import 'package:flutter_capstone_6/model/class_offline_outer.dart';
import 'package:flutter_capstone_6/model/class_offline_rows.dart';
import 'package:flutter_capstone_6/screen/main/booking/booking_class_screen.dart';
import 'package:flutter_capstone_6/widget/appbar_home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.token}) : super(key: key);

  final String token;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ClassOfflineOuter? classOfflineOuter;
  List<ClassOfflineRows>? classOfflineRows;
  String? coba;

  late SharedPreferences storageData;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    storageData = await SharedPreferences.getInstance();
  }

  Future getOfflineClass(String token) async {
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json'
    };

    try {
      http.Response response = await http.get(
          Uri.parse('https://www.go-rest-api.live/api/v1/classes/offline'),
          headers: headers);

      if (response.statusCode == 200) {
        print('JSON Response: ${response.body}');

        Map<String, dynamic> classBody = jsonDecode(response.body);
        classOfflineOuter = ClassOfflineOuter.fromJson(classBody);
        classOfflineRows = classOfflineOuter!.data.rows;

        print(classOfflineOuter!.data.page);
        print(classOfflineRows!.first.workout);
      }
    } catch (e) {
      print(e);
    }
  }

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
              const SizedBox(height: 1),
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
                    // featureCard(yellow, 'Membership',
                    //     'Practice Anytime Anywhere at any Gym', 'Upgrade'),
                    // const SizedBox(width: 15),
                    featureCard(
                        violet,
                        'Populer Articles',
                        'Give you the latest and informative news',
                        'Read More',
                        'populer_articles.png'),
                    const SizedBox(width: 15),
                    featureCard(
                        orange,
                        'Workout Video',
                        'Watch exercise video anywhere and anytime',
                        'Watch More',
                        'workout_video.png'),
                  ],
                ),
              ),

              // Our Features Section
              const SizedBox(height: 24),
              const Text(
                'Our Features',
                style: TextStyle(
                  color: fontGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  getOfflineClass(storageData.getString('token').toString());
                  // print(classOfflineRows![0].workout);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const BookingClassScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 21),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: violet,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Get Your Class Here',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                          const SizedBox(width: 15),
                          SvgPicture.asset(
                            'assets/home/btn_add.svg',
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/home/our_features.svg',
                      ),
                    ],
                  ),
                  // decoration: BoxDecoration(
                  //     color: white,
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: n40.withOpacity(0.5),
                  //         spreadRadius: 0,
                  //         blurRadius: 5,
                  //       )
                  //     ]),
                ),
              ),

              // Recommendation Class Section
              const SizedBox(height: 24),
              const Text(
                'Top 5 Classes in this Month',
                style: TextStyle(
                  color: n100,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: n40.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    topclassCard('img1.png', 'Upper body strech', '4.9',
                        '112.521 Views'),
                    divider(),
                    topclassCard('img2.png', 'Sixpack exercise at home', '4.8',
                        '102.735 Views'),
                    divider(),
                    topclassCard(
                        'img3.png', 'Cardio exercise', '4.8', '93.951 Views'),
                    divider(),
                    topclassCard(
                        'img1.png', 'Night yoga flow', '4.7', '92.121 Views'),
                    divider(),
                    topclassCard(
                        'img2.png', 'Shoulder exercise', '4.7', '89.521 Views'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: const [
        SizedBox(height: 16),
        Divider(
          height: 12,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: n5,
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget topclassCard(String image, String title, String star, String view) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            width: 90,
            height: 90,
            child: Image.asset(
              'assets/home/$image',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: n100,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('assets/home/blue_star.svg'),
                const SizedBox(width: 5),
                Text(
                  star,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n80,
                  ),
                )
              ],
            ),
            Row(
              children: [
                SvgPicture.asset('assets/home/blue_eye.svg'),
                const SizedBox(width: 5),
                Text(
                  view,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n80,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget featureCard(Color color, String title, String subtitle,
      String btnTitle, String image) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
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
              height: 125,
              child: Image.asset(
                'assets/home/$image',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

// Not Used
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
