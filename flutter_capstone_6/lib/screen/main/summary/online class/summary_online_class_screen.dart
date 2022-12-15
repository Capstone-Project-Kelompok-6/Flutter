import 'dart:convert';

import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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

  // video info
  String videoDuration = '';
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    final userId = context.read<LoginViewModel>().getDatas.first.data.userId;
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;

    getBookOnlineClass(userToken, userId);
    print(userId);
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
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : summaryOnlineRows != null
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: summaryOnlineRows!.length,
                        itemBuilder: (context, index) {
                          // print(summaryOnlineRows![0].workout);

                          // get video duration
                          FFprobeKit.getMediaInformation(
                                  summaryOnlineRows![0].video)
                              .then((session) {
                            final durationInfo =
                                session.getMediaInformation()!.getDuration();

                            // change to duration
                            var seconds = double.parse(durationInfo!).round();
                            duration = Duration(seconds: seconds);

                            // formatting duration
                            format(Duration d) => d.toString().substring(2, 7);
                            setState(() {
                              videoDuration = format(duration).toString();
                            });

                            print(
                                "${summaryOnlineRows![0].videoTitle}: $videoDuration");
                          });

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SummaryOnlineClassDetail(
                                            classTitle:
                                                summaryOnlineRows![index]
                                                    .workout,
                                            classImage:
                                                summaryOnlineRows![index]
                                                    .thumbnail,
                                            classVideoTitle:
                                                summaryOnlineRows![index]
                                                    .videoTitle,
                                            classDesc: summaryOnlineRows![index]
                                                .description,
                                            video:
                                                summaryOnlineRows![index].video,
                                            duration: duration,
                                          )));
                            },
                            child: itemCard(summaryOnlineRows![index].thumbnail,
                                summaryOnlineRows![index].videoTitle, duration),
                          );
                        },
                      )
                    : emptyCard(),
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
                    "${duration.inMinutes}m ${duration.inSeconds}s",
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
        // controller: _titleController,
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
          // prefixIcon: Container(
          //   margin: const EdgeInsets.only(
          //       left: 20, right: 8, top: 14, bottom: 14),
          //   child: SvgPicture.asset(
          //     'assets/icons/search.svg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }
}
