import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/model/summary_offline/summary_offline_outer.dart';
import 'package:flutter_capstone_6/model/summary_offline/summary_offline_rows.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/summary/offline%20class/summary_offline_class_detail.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../component/colors.dart';

class SummaryOfflineClassScreen extends StatefulWidget {
  const SummaryOfflineClassScreen({Key? key}) : super(key: key);

  @override
  State<SummaryOfflineClassScreen> createState() =>
      _SummaryOfflineClassScreenState();
}

class _SummaryOfflineClassScreenState extends State<SummaryOfflineClassScreen> {
  SummaryOfflineOuter? summaryOfflineOuter;
  List<SummaryOfflineRows>? summaryOfflineRows;
  bool isLoading = true;
  TextEditingController searchbarController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    final userId = context.read<LoginViewModel>().getDatas.first.data.userId;
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;

    getBookOfflineClass(userToken, userId);
    // print(userId);
  }

  Future getBookOfflineClass(String token, String userId) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://www.go-rest-api.live/api/v1/books/offline?userId=$userId'),
        headers: {
          'Authorization': 'Bearer ' + token,
          'Content-type': 'application/json'
        },
      );

      isLoading = false;
      print('JSON Response: ${response.body}');
      // print(response.statusCode);
      print(userId);

      if (response.statusCode == 200) {
        Map<String, dynamic> summaryBody = jsonDecode(response.body);

        setState(() {
          summaryOfflineOuter = SummaryOfflineOuter.fromJson(summaryBody);
          summaryOfflineRows = summaryOfflineOuter!.data!.rows;
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
                : (summaryOfflineRows != null)
                    ? SingleChildScrollView(
                        child: Column(children: [
                          for (int i = 0; i < summaryOfflineRows!.length; i++)
                            if (summaryOfflineRows![i]
                                .workout
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SummaryOfflineClassDetail(
                                                classId: summaryOfflineRows![i]
                                                    .classId,
                                                classTitle:
                                                    summaryOfflineRows![i]
                                                        .workout,
                                                classImage:
                                                    summaryOfflineRows![i]
                                                        .workoutImage,
                                                classInstructor:
                                                    summaryOfflineRows![i]
                                                        .instructorName,
                                                classDesc:
                                                    summaryOfflineRows![i]
                                                        .description,
                                                classSchedule:
                                                    summaryOfflineRows![i]
                                                        .classDates,
                                                price: summaryOfflineRows![i]
                                                    .price,
                                                createdAt:
                                                    summaryOfflineRows![i]
                                                        .createdAt,
                                                endClassDate:
                                                    summaryOfflineRows![i]
                                                        .endClassDate,
                                              )));
                                },
                                child: itemCard(
                                    summaryOfflineRows![i].workoutImage,
                                    summaryOfflineRows![i].workout,
                                    summaryOfflineRows![i].instructorName,
                                    summaryOfflineRows![i].classDates),
                              )
                        ]),
                      )
                    : emptyCard(),
          ],
        ),
      ),
    );
  }

  Widget noSearch() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: summaryOfflineRows!.length,
      itemBuilder: (context, index) {
        // print(summaryOfflineRows![0].workout);
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SummaryOfflineClassDetail(
                          classId: summaryOfflineRows![index].classId,
                          classTitle: summaryOfflineRows![index].workout,
                          classImage: summaryOfflineRows![index].workoutImage,
                          classInstructor:
                              summaryOfflineRows![index].instructorName,
                          classDesc: summaryOfflineRows![index].description,
                          classSchedule: summaryOfflineRows![index].classDates,
                          price: summaryOfflineRows![index].price,
                          createdAt: summaryOfflineRows![index].createdAt,
                          endClassDate: summaryOfflineRows![index].endClassDate,
                        )));
          },
          child: itemCard(
              summaryOfflineRows![index].workoutImage,
              summaryOfflineRows![index].workout,
              summaryOfflineRows![index].instructorName,
              summaryOfflineRows![index].classDates),
        );
      },
    );
  }

  Widget itemCard(
      String image, String title, String instructor, List schedule) {
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
              Text(
                instructor,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: n80,
                ),
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      const Text(
                        "Schedule : ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                      for (int i = 0; i < schedule.length; i++)
                        Text(
                          (schedule[i] as String).split(' (')[0] +
                              ((schedule.length - 1 == i) ? '' : ', '),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: n60,
                            // height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ],
              ),
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
