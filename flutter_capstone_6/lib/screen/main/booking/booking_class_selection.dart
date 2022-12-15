import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_class.dart';
import 'package:flutter_capstone_6/screen/main/booking/online_class/booking_online_class.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingClassSelection extends StatefulWidget {
  const BookingClassSelection({Key? key}) : super(key: key);

  @override
  State<BookingClassSelection> createState() => _BookingClassSelectionState();
}

class _BookingClassSelectionState extends State<BookingClassSelection> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteBg,
        appBar: AppBar(
          elevation: 0.7,
          backgroundColor: whiteBg,
          automaticallyImplyLeading: false,
          title: const Text(
            'Booking Class',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: n100,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
          bottom: const TabBar(
            labelColor: violet,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelColor: n60,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: violet, width: 2),
                insets: EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
            tabs: [
              Tab(
                text: 'Offline Class',
              ),
              Tab(
                text: 'Online Class',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BookingOfflineClass(),
            BookingOnlineClass(),
          ],
        ),
      ),
    );
  }
}
