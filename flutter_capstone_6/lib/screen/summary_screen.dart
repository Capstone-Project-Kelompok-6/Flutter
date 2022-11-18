import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String selectedChips = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
          style:
              TextStyle(color: n100, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: whiteBg,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Column(children: [
            _searchBar(),
            _choiceChips(0),
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: n40.withOpacity(0.5), blurRadius: 0.1, spreadRadius: 0)
          ], color: white, borderRadius: BorderRadius.circular(10)),
          child: ListView(
            children: [
              Center(
                heightFactor: 15,
                child: Text(
                  selectedChips,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
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
              side: BorderSide(color: Colors.grey),
              label: Text('Booked Class'),
              selected: (selectedChips == 'Booked Class') ? true : false,
              selectedColor: Colors.grey,
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
              side: BorderSide(color: Colors.grey),
              label: Text('Finished Class'),
              selected: (selectedChips == 'Finished Class') ? true : false,
              selectedColor: Colors.grey,
              onSelected: (bool value) {
                setState(() {
                  selectedChips =
                      'Finished Class'; //TODO ganti ke fungsi untuk ambil data Api;
                });
              },
            ),
            SizedBox(
              width: 4,
            ),
            ChoiceChip(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.grey),
              label: Text('     History     '),
              selected: (selectedChips == 'History') ? true : false,
              selectedColor: Colors.grey,
              onSelected: (bool value) {
                setState(() {
                  selectedChips =
                      'History'; //TODO ganti ke fungsi untuk ambil data Api;
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
            hintText: 'Search article or video',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide())),
      ),
    );
  }
}
