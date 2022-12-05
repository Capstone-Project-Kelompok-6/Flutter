import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingOnlineClass extends StatefulWidget {
  const BookingOnlineClass({Key? key}) : super(key: key);

  @override
  State<BookingOnlineClass> createState() => _BookingOnlineClassState();
}

class _BookingOnlineClassState extends State<BookingOnlineClass> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Online Class'),
    );
  }
}
