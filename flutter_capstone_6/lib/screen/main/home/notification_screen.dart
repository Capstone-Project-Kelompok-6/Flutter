import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/home/notification_view_model.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? classtype;
  String? classtitle;
  bool isEmpty = true;

  late SharedPreferences storageData;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    storageData = await SharedPreferences.getInstance();

    setState(() {
      isEmpty = storageData.getBool('notifEmpty')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteBg,
        appBar: appBar(context, 'Notification'),
        body: isEmpty
            ? emptyNotif()
            : Consumer<NotificationViewModel>(
                builder: (context, NotificationViewModel data, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.getDatas.length,
                  itemBuilder: (context, index) {
                    int itemCount = data.getDatas.length;
                    int reversedIndex = itemCount - 1 - index;
                    final notifData = data.getDatas[reversedIndex];

                    return newNotif(notifData.classType, notifData.className,
                        notifData.dateTime);
                  },
                );
              }));
  }

  Widget newNotif(String classType, String classTitle, DateTime date) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: navy, width: 2),
          color: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/info_blue.svg',
                  color: n100,
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        classType == 'Offline Class'
                            ? "Booked $classType - $classTitle"
                            : "Buy $classType - $classTitle",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: n100,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      classType == 'Offline Class'
                          ? "You have booked this class!"
                          : "You have bought this class!",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: n80,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat("dd MMM").format(date),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n60,
                  ),
                ),
                Text(
                  DateFormat.Hm().format(date),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n60,
                  ),
                ),
              ],
            )
          ],
        ));
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
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
