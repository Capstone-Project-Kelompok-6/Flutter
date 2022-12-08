import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({Key? key}) : super(key: key);

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, "Payment"),
      body: Column(
        children: [],
      ),
    );
  }
}
