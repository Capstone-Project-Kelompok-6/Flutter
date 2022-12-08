import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/booking_class_selection.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingClassScreen extends StatefulWidget {
  const BookingClassScreen({Key? key}) : super(key: key);

  @override
  State<BookingClassScreen> createState() => _BookingClassScreenState();
}

class _BookingClassScreenState extends State<BookingClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Booking Class'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  SvgPicture.asset('assets/booking_class/booking_class.svg'),
                  const SizedBox(height: 16),
                  const Text(
                    'Choose your class',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                    width: 330,
                    child: Text(
                      'Get a various interesting features from unlimited access to watch videos and being able to choose the instructor as you wish.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: n60,
                          height: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 64),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BookingClassSelection()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: violet,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Choose your plan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
