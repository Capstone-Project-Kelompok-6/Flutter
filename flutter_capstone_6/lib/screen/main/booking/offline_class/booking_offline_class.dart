import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/class_offline/class_offline_outer.dart';
import 'package:flutter_capstone_6/model/class_offline/class_offline_rows.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_class_detail.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BookingOfflineClass extends StatefulWidget {
  const BookingOfflineClass({Key? key}) : super(key: key);

  @override
  State<BookingOfflineClass> createState() => _BookingOfflineClassState();
}

class _BookingOfflineClassState extends State<BookingOfflineClass> {
  ClassOfflineOuter? classOfflineOuter;
  List<ClassOfflineRows>? classOfflineRows;
  bool isLoading = true;
  TextEditingController searchbarController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;
    getOfflineClass(userToken);
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

      isLoading = false;
      print('JSON Response: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> classBody = jsonDecode(response.body);

        setState(() {
          classOfflineOuter = ClassOfflineOuter.fromJson(classBody);
          classOfflineRows = classOfflineOuter!.data.rows;
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
            // Text(searchText),
            const SizedBox(height: 24),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : classOfflineRows != null
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < classOfflineRows!.length; i++)
                              if (classOfflineRows![i]
                                  .workout
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase()))
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BookingOfflineClassDetail(
                                                    classId:
                                                        classOfflineRows![i]
                                                            .classId,
                                                    classTitle:
                                                        classOfflineRows![i]
                                                            .workout,
                                                    classImage:
                                                        classOfflineRows![i]
                                                            .workoutImage,
                                                    classInstructor:
                                                        classOfflineRows![i]
                                                            .instructorName,
                                                    classDesc:
                                                        classOfflineRows![i]
                                                            .description,
                                                    classSchedule:
                                                        classOfflineRows![i]
                                                            .classDates,
                                                    price: classOfflineRows![i]
                                                        .price)));
                                  },
                                  child: offlineClassCard(
                                      classOfflineRows![i].workoutImage,
                                      classOfflineRows![i].workout,
                                      classOfflineRows![i].classDates,
                                      classOfflineRows![i].instructorName),
                                )
                          ],
                        ),
                      )
                    : Container()
          ],
        ),
      ),
    );
  }

  Widget noSearch() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: classOfflineRows!.length,
      itemBuilder: (context, index) {
        final classData = classOfflineRows![index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingOfflineClassDetail(
                        classId: classData.classId,
                        classTitle: classData.workout,
                        classImage: classData.workoutImage,
                        classInstructor: classData.instructorName,
                        classDesc: classData.description,
                        classSchedule: classData.classDates,
                        price: classData.price)));
          },
          child: offlineClassCard(classData.workoutImage, classData.workout,
              classData.classDates, classData.instructorName),
        );
      },
    );
  }

  Widget offlineClassCard(
      String image, String title, List schedule, String instructor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Instructor : ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                      Text(
                        instructor,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      const Text(
                        "Class Schedule : ",
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
                          ),
                        ),
                    ],
                  ),
                ],
              ))
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
          focusColor: n100,
        ),
      ),
    );
  }
}
