import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/summary/history/history_screen.dart';
import 'package:flutter_capstone_6/screen/main/summary/offline%20class/offline_class_screen.dart';
import 'package:flutter_capstone_6/screen/main/summary/online%20class/online_class_screen.dart';
import 'package:flutter_capstone_6/widget/appbar_summary.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String selectedChips = '';
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
            OfflineClassScreen(),
            OnlineClassScreen(),
            HistoryScreen()
          ],
        ),
      ),
    );
  }

  Widget _choiceChips(int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 26, 12),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChoiceChip(
              backgroundColor: whiteBg,
              side: BorderSide(color: navy),
              label: Text('      Booked Class      '),
              selected: (selectedChips == 'Booked Class') ? true : false,
              selectedColor: navy,
              onSelected: (bool value) {
                setState(() {
                  selectedChips; //TODO ganti ke fungsi untuk ambil data Api;
                });
              },
            ),
            SizedBox(
              width: 4,
            ),
            ChoiceChip(
              backgroundColor: whiteBg,
              side: BorderSide(color: navy),
              label: Text('      Finished Class      '),
              selected: (selectedChips == 'Finished Class') ? true : false,
              selectedColor: navy,
              onSelected: (bool value) {
                setState(() {
                  selectedChips =
                      'Finished Class'; //TODO ganti ke fungsi untuk ambil data Api;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

//     child: Scaffold(
//   appBar: AppBar(
//     title: Text(
//       'Summary',
//       style:
//           TextStyle(color: n100, fontSize: 20, fontWeight: FontWeight.bold),
//     ),
//     backgroundColor: whiteBg,
//     automaticallyImplyLeading: false,
//     elevation: 0.0,
//     bottom: PreferredSize(
//       preferredSize: Size.fromHeight(120),
//       child: Column(children: [
//         _searchBar(),
//         _choiceChips(0),
//       ]),
//     ),
//   ),
//   body: Padding(
//     padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
//     child: Container(
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             color: n40.withOpacity(0.5), blurRadius: 0.1, spreadRadius: 0)
//       ], color: white, borderRadius: BorderRadius.circular(10)),
//       child: ListView(
//         children: [
//           Center(
//             heightFactor: 15,
//             child: Text(
//               selectedChips,
//               style: TextStyle(fontSize: 20),
//             ),
//           )
//         ],
//       ),
//     ),
//   ),
// ));
