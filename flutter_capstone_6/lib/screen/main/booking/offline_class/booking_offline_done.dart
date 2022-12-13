import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/bottom_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingOfflineDone extends StatefulWidget {
  const BookingOfflineDone({
    Key? key,
    required this.classTitle,
    required this.classInstructor,
  }) : super(key: key);
  final String classTitle;
  final String classInstructor;

  @override
  State<BookingOfflineDone> createState() => _BookingOfflineDoneState();
}

class _BookingOfflineDoneState extends State<BookingOfflineDone> {
  late SharedPreferences storageData;
  final DateTime today = DateTime.now();
  DateTime nextMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    initial();
    nextMonth = DateTime(today.year, today.month + 1, today.day);
  }

  void initial() async {
    storageData = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: n100,
          ),
        ),
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationBarController(
                        token: storageData.getString('token').toString())));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/arrow_back.svg',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: violet,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Text(
              widget.classTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Instructor",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Booking Date",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Validity Period up to",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.classInstructor,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat("EEEE, dd MMMM yyyy").format(today),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat("EEEE, dd MMMM yyyy").format(nextMonth),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.asset('assets/barcode.png'),
            )
          ],
        ),
      ),
    );
  }
}
