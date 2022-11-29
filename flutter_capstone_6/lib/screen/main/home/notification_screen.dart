import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar_notification_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: const BoxDecoration(
            color: whiteBg,
          ),
          child: const AppBarContentNF(),
        ),
      ),
      body: isEmpty ? emptyNotif() : Container(),
    );
  }

  Widget emptyNotif() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/home/notification_screen.png'),
          const SizedBox(height: 24),
          const SizedBox(
            width: 327,
            child: Text(
              "Stay tuned, we will always give you the latest and informative news",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: n80,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
