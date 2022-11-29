import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/summary/offline%20class/offline_class_screen.dart';

class AppBarSummary extends StatefulWidget {
  const AppBarSummary({super.key});

  @override
  State<AppBarSummary> createState() => _AppBarSummaryState();
}

class _AppBarSummaryState extends State<AppBarSummary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: whiteBg,
        appBar: AppBar(
          elevation: 0.7,
          backgroundColor: whiteBg,
          automaticallyImplyLeading: false,
          title: Text(
            'Summary',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'Offline Class',
              ),
              Tab(
                text: 'Online Class',
              ),
              Tab(
                text: 'History',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
                child: Text(
              'OFFLINE CLASS',
              style: TextStyle(color: Colors.black),
            )),
            Container(
                child: Text(
              'OFFLINE CLASS',
              style: TextStyle(color: Colors.black),
            )),
            Container(
                child: Text(
              'OFFLINE CLASS',
              style: TextStyle(color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}
