import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/component/offline_class_provider.dart';
import 'package:flutter_capstone_6/screen/main/booking/booking_offline_class.dart';
import 'package:flutter_capstone_6/screen/main/booking/booking_online_class.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingClassSelection extends StatefulWidget {
  const BookingClassSelection({Key? key}) : super(key: key);

  @override
  State<BookingClassSelection> createState() => _BookingClassSelectionState();
}

class _BookingClassSelectionState extends State<BookingClassSelection> {
  late SharedPreferences storageData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
    // Provider.of<OfflineClassProvider>(context, listen: false)
    //     .getOfflineClass(storageData.getString('token').toString());
    // print(storageData.getString('token').toString());
  }

  void initialize() async {
    storageData = await SharedPreferences.getInstance();
  }

  String selectedChips = '';
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
            unselectedLabelColor: n60,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: violet, width: 2),
                insets: EdgeInsets.symmetric(horizontal: 60, vertical: 5)),
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
        body: TabBarView(
          children: [
            BookingOfflineClass(
                token: storageData.getString('token').toString()),
            BookingOnlineClass(),
          ],
        ),
      ),
    );
  }

  Future<SharedPreferences> storage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
