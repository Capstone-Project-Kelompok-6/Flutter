import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingOfflineClass extends StatefulWidget {
  const BookingOfflineClass({Key? key}) : super(key: key);

  @override
  State<BookingOfflineClass> createState() => _BookingOfflineClassState();
}

class _BookingOfflineClassState extends State<BookingOfflineClass> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Offline Class'),
    );
  }
}
