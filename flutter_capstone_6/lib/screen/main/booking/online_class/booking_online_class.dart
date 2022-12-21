import 'dart:convert';
import 'dart:developer';

import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/class_online/class_online_outer.dart';
import 'package:flutter_capstone_6/model/class_online/class_online_rows.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/booking/online_class/booking_online_class_detail.dart';
import 'package:flutter_capstone_6/screen/main/booking/online_class/booking_online_seeall.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BookingOnlineClass extends StatefulWidget {
  const BookingOnlineClass({Key? key}) : super(key: key);

  @override
  State<BookingOnlineClass> createState() => _BookingOnlineClassState();
}

class _BookingOnlineClassState extends State<BookingOnlineClass> {
  ClassOnlineOuter? classOnlineOuter;
  List<ClassOnlineRows>? classOnlineRows;
  Set<String> classOnlineRows2 = {};
  Map<String, List<ClassOnlineRows>> classOnlineRows3 = {};
  bool isLoading = true;
  // TextEditingController searchbarController = TextEditingController();
  // String searchText = '';

  @override
  void initState() {
    super.initState();
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;
    getOnlineClass(userToken);
  }

  Future getOnlineClass(String token) async {
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json'
    };

    try {
      http.Response response = await http.get(
          Uri.parse('https://www.go-rest-api.live/api/v1/classes/online'),
          headers: headers);

      isLoading = false;
      print('JSON Response: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> classBody = jsonDecode(response.body);

        setState(() {
          classOnlineOuter = ClassOnlineOuter.fromJson(classBody);
          classOnlineRows = classOnlineOuter!.data.rows;

          for (var item in classOnlineRows!) {
            classOnlineRows2.add(item.workout);
          }

          for (var item1 in classOnlineRows2) {
            classOnlineRows3.addAll({item1: []});
            for (var item2 in classOnlineRows!) {
              if (item1 == item2.workout) {
                classOnlineRows3[item1]!.add(item2);
              }
            }
          }

          inspect(classOnlineRows3);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Duration> getDuration(ClassOnlineRows classData) async {
    Duration duration = Duration.zero;
    // get video duration
    var session = await FFprobeKit.getMediaInformation(classData.video);
    final durationInfo = session.getMediaInformation()!.getDuration();

    // change to duration
    var seconds = double.parse(durationInfo!).round();
    duration = Duration(seconds: seconds);

    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // searchBarItem(),
            // Text(searchText),
            // const SizedBox(height: 24),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : classOnlineRows != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: classOnlineRows2.length,
                        itemBuilder: (context, index) {
                          final workout = classOnlineRows2.toList()[index];

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleWorkout(workout),
                              const SizedBox(height: 12),
                              if (workout ==
                                  classOnlineRows3.keys.toList()[index])
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18),
                                  child: SizedBox(
                                    height: 240,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: classOnlineRows3.values
                                          .toList()[index]
                                          .length,
                                      itemBuilder: (context, index2) {
                                        final classData = classOnlineRows3
                                            .values
                                            .toList()[index][index2];

                                        return FutureBuilder<Duration>(
                                            future: getDuration(classData),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return const SizedBox();
                                              }

                                              // formatting duration
                                              format(Duration d) =>
                                                  d.toString().substring(2, 7);
                                              String videoDuration = format(
                                                      snapshot.data ??
                                                          Duration.zero)
                                                  .toString();

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BookingOnlineClassDetail(
                                                                classId:
                                                                    classData
                                                                        .classId,
                                                                classTitle:
                                                                    classData
                                                                        .workout,
                                                                classImage:
                                                                    classData
                                                                        .thumbnail,
                                                                classVideoTitle:
                                                                    classData
                                                                        .videoTitle,
                                                                classDesc: classData
                                                                    .description,
                                                                price: classData
                                                                    .price,
                                                                video: classData
                                                                    .video,
                                                                duration: snapshot
                                                                        .data ??
                                                                    Duration
                                                                        .zero,
                                                              )));
                                                },
                                                child: onlineClassCard(
                                                    classData.thumbnail,
                                                    classData.videoTitle,
                                                    videoDuration),
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                )
                            ],
                          );
                        },
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }

  Widget onlineClassCard(String image, String title, String duration) {
    return Container(
      width: 361,
      margin: const EdgeInsets.only(bottom: 12, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: n40.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
          )
        ],
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                // image: AssetImage('assets/explore/img1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: n100,
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
            child: Container(
              width: double.infinity,
              height: 35,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWorkout(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: n100,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingOnlineSeeAll(
                        title: title, classOnlineRows3: classOnlineRows3)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: n5,
            ),
            child: const Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: violet,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget searchBarItem() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: searchbarController,
        // onChanged: (value) {
        //   setState(() {
        //     searchText = value;
        //   });
        // },
        decoration: const InputDecoration(
          fillColor: white,
          labelText: 'Search',
          labelStyle: TextStyle(
            fontSize: 16,
            color: n20,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: n100),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: n60)),
          contentPadding: EdgeInsets.all(12),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }
}
