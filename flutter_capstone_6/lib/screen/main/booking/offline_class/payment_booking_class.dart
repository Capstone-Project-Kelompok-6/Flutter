import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class PaymentOfflineClass extends StatefulWidget {
  const PaymentOfflineClass({Key? key}) : super(key: key);

  @override
  State<PaymentOfflineClass> createState() => _PaymentOfflineClassState();
}

class _PaymentOfflineClassState extends State<PaymentOfflineClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Payment'),
      body: Column(
        children: [],
      ),
    );
  }
}
