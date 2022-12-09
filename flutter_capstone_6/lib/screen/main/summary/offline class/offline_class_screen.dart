import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../component/colors.dart';

class OfflineClassScreen extends StatefulWidget {
  const OfflineClassScreen({Key? key}) : super(key: key);

  @override
  State<OfflineClassScreen> createState() => _OfflineClassScreenState();
}

class _OfflineClassScreenState extends State<OfflineClassScreen> {
  String selectedChips = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(children: [
        Column(children: [
          SizedBox(
            height: 24,
          ),
          _searchBar(),
          SizedBox(
            height: 10,
          ),
          _choiceChips(0),
        ]),
      ]),
    ));
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
              label: Text(
                '      Booked Class      ',
              ),
              selected: (selectedChips == 'Booked Class') ? true : false,
              selectedColor: navy,
              onSelected: (bool value) {
                setState(() {
                  selectedChips =
                      'Booked Class'; //TODO ganti ke fungsi untuk ambil data Api;
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
