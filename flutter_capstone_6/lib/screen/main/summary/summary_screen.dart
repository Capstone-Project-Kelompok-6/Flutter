import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/summary/offline%20class/summary_offline_class_screen.dart';
import 'package:flutter_capstone_6/screen/main/summary/online%20class/summary_online_class_screen.dart';

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
      length: 2,
      child: Scaffold(
        backgroundColor: whiteBg,
        appBar: AppBar(
          backgroundColor: whiteBg,
          elevation: 0.7,
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.only(left: 9),
            child: const Text(
              'Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: n100,
              ),
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
              ),
              // Tab(
              //   text: 'History',
              // )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SummaryOfflineClassScreen(),
            SummaryOnlineClassScreen(),
            // HistoryScreen()
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
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
