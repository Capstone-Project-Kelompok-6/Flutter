import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/offline_class_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingOfflineClass extends StatefulWidget {
  final String token;
  const BookingOfflineClass({Key? key, required this.token}) : super(key: key);

  @override
  State<BookingOfflineClass> createState() => _BookingOfflineClassState();
}

class _BookingOfflineClassState extends State<BookingOfflineClass> {
  late SharedPreferences storageData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
    final data = Provider.of<OfflineClassProvider>(context, listen: false);
    data.getOfflineClass(widget.token);
    print(data.classList);
    print('test ${widget.token}');
  }

  void initialize() async {
    storageData = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final classData = Provider.of<OfflineClassProvider>(context);

    return ListView.builder(
        itemCount: classData.classList.length,
        itemBuilder: ((context, index) => InkWell(
              onTap: () {},
              child: Column(
                  children: [Text(classData.classList[index].class_id!)]),
            )));
  }
}
