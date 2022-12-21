import 'dart:convert';

import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/summary_online/summary_online_outer.dart';
import 'package:flutter_capstone_6/model/summary_online/summary_online_rows.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/summary/online%20class/summary_online_class_detail.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SummaryOnlineClassScreen extends StatefulWidget {
  const SummaryOnlineClassScreen({Key? key}) : super(key: key);

  @override
  State<SummaryOnlineClassScreen> createState() =>
      _SummaryOnlineClassScreenState();
}

class _SummaryOnlineClassScreenState extends State<SummaryOnlineClassScreen> {
  SummaryOnlineOuter? summaryOnlineOuter;
  List<SummaryOnlineRows>? summaryOnlineRows;
  bool isLoading = true;
  TextEditingController searchbarController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    final userId = context.read<LoginViewModel>().getDatas.first.data.userId;
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;

    getBookOnlineClass(userToken, userId);
    // print(userId);
  }

  Future getBookOnlineClass(String token, String userId) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://www.go-rest-api.live/api/v1/books/online?userId=$userId'),
        headers: {
          'Authorization': 'Bearer ' + token,
          'Content-type': 'application/json'
        },
      );

      isLoading = false;
      print('JSON Response: ${response.body}');
      // print(response.statusCode);
      // print(userId);

      if (response.statusCode == 200) {
        Map<String, dynamic> summaryBody = jsonDecode(response.body);

        setState(() {
          summaryOnlineOuter = SummaryOnlineOuter.fromJson(summaryBody);
          summaryOnlineRows = summaryOnlineOuter!.data!.rows;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Duration> getDuration(SummaryOnlineRows classData) async {
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
          children: [
            searchBarItem(),
            const SizedBox(height: 24),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : (summaryOnlineRows == null || summaryOnlineRows!.isEmpty)
                    ? emptyCard()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < summaryOnlineRows!.length; i++)
                              if (summaryOnlineRows![i]
                                  .videoTitle
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase()))
                                FutureBuilder<Duration>(
                                    future: getDuration(summaryOnlineRows![i]),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox();
                                      }

                                      return GestureDetector(
                                        onTap: () {
                                          final classData =
                                              summaryOnlineRows![i];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SummaryOnlineClassDetail(
                                                        classTitle:
                                                            classData.workout,
                                                        classImage:
                                                            classData.thumbnail,
                                                        classVideoTitle:
                                                            classData
                                                                .videoTitle,
                                                        classDesc: classData
                                                            .description,
                                                        video: classData.video,
                                                        duration:
                                                            snapshot.data ??
                                                                Duration.zero,
                                                      )));
                                        },
                                        child: itemCard(
                                            summaryOnlineRows![i].thumbnail,
                                            summaryOnlineRows![i].videoTitle,
                                            snapshot.data ?? Duration.zero),
                                      );
                                    })
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  Widget itemCard(String image, String title, Duration duration) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: n20.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
          )
        ],
        color: white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 90,
              height: 90,
              // Image.asset(
              //   'assets/explore/img1.png',
              //   fit: BoxFit.cover,
              //   width: 90,
              //   height: 90,
              // ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: n100,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  const Text(
                    "Duration : ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                  ),
                  Text(
                    "${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget emptyCard() {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "There's nothing here, yet.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: n60,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBarItem() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        controller: searchbarController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
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
