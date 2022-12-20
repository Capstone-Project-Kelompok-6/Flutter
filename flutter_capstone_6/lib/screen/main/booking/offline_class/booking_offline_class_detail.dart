import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/component/currency.dart';
import 'package:flutter_capstone_6/model/notification.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/payment_method.dart';
import 'package:flutter_capstone_6/screen/main/home/notification_view_model.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingOfflineClassDetail extends StatefulWidget {
  const BookingOfflineClassDetail({
    Key? key,
    required this.classId,
    required this.classTitle,
    required this.classImage,
    required this.classInstructor,
    required this.classDesc,
    required this.classSchedule,
    required this.price,
  }) : super(key: key);
  final String classId;
  final String classTitle;
  final String classImage;
  final String classInstructor;
  final String classDesc;
  final List classSchedule;
  final int price;

  @override
  State<BookingOfflineClassDetail> createState() =>
      _BookingOfflineClassDetailState();
}

class _BookingOfflineClassDetailState extends State<BookingOfflineClassDetail> {
  late SharedPreferences storageData;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    storageData = await SharedPreferences.getInstance();
  }

  Future bookOfflineClass(String token, String userId) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://www.go-rest-api.live/api/v1/books/offline'),
          headers: {
            'Authorization': 'Bearer ' + token,
            'Content-type': 'application/json'
          },
          body: jsonEncode({
            "class_id": widget.classId,
            "user_id": userId,
            "is_online": false
          }));

      print('JSON Response: ${response.body}');
      // print(response.statusCode);
      // print(userId);

      if (response.statusCode == 200) {
        // State Management
        final data = Provider.of<NotificationViewModel>(context, listen: false);
        final notifDetail = NotificationClass(
          classType: 'Offline Class',
          className: widget.classTitle,
          dateTime: DateTime.now(),
        );
        data.addNotif(notifDetail);

        storageData.setBool('notifEmpty', false);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentMethod(
                      classTitle: widget.classTitle,
                      classInstructor: widget.classInstructor,
                      price: widget.price,
                    )));
      }

      if (response.statusCode == 409) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/info_blue.svg',
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        ' Info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: navy,
                        ),
                      ),
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(top: 16, bottom: 5),
                  contentPadding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  content: const Text(
                    'You already book this class',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: n80,
                    ),
                  ),
                ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, widget.classTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // workout image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.classImage,
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),

              // instructor name
              const SizedBox(height: 24),
              const Text(
                "Instructor:",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: n100,
                ),
              ),
              Text(
                widget.classInstructor,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),

              // divider
              divider(),

              // informations
              const Text(
                'Informations',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: violet,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.classDesc,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: n80,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Time Schedule :",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.classSchedule.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        widget.classSchedule[index],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n80,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: double.infinity,
        height: 76,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: n40.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 3,
            )
          ],
          color: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Payment",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n100,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      CurrencyFormat.convertToIdr(widget.price, 0),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: violet,
                      ),
                    ),
                    const Text(
                      "/ month",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: violet,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Buy ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: violet,
                                ),
                              ),
                              Text(
                                widget.classTitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: violet,
                                ),
                              ),
                              const Text(
                                " Class ?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: violet,
                                ),
                              ),
                            ],
                          ),
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // cancel button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: white,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: violet),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: violet,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              // booking button
                              ElevatedButton(
                                onPressed: () {
                                  bookOfflineClass(
                                      context
                                          .read<LoginViewModel>()
                                          .getDatas
                                          .first
                                          .data
                                          .accessToken,
                                      context
                                          .read<LoginViewModel>()
                                          .getDatas
                                          .first
                                          .data
                                          .userId);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: violet,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text(
                                  "Booking Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  primary: violet,
                  minimumSize: const Size(146, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: const [
        SizedBox(height: 10),
        Divider(
          height: 12,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: n20,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
