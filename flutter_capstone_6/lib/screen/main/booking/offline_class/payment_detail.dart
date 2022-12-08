import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/payment_success.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // detail section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: navy),
                borderRadius: BorderRadius.circular(10),
                color: whiteBg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Yoga Class",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Booking Number",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Booking Date",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Validity Period up to",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Discount",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Sub Total :",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "YO001",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Thursday, 17 November 2022",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Saturday, 17 Desember 2022",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Rp. 500.000",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: n100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // vn bank
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: navy),
                borderRadius: BorderRadius.circular(10),
                color: whiteBg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dana",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: n100,
                        ),
                      ),
                      Image.asset("assets/payment/dana.png"),
                    ],
                  ),
                  divider(),
                  const Text(
                    "Account Number",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "1190812345678",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(
                              const ClipboardData(text: "1190812345678"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: white,
                            behavior: SnackBarBehavior.floating,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24),
                            margin: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 5),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            content: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/payment/check.svg',
                                  color: violet,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Account number has been copy",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: violet,
                                  ),
                                ),
                              ],
                            ),
                          ));
                        },
                        child: const Text(
                          "Copy",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: navy,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // promo code
            const Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 12),
              child: Text(
                "Promo Code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: navy),
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: white,
                  labelText: 'Input Promo Code',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: n40,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const Center(
                            child: Text(
                              "Buy Yoga Class?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: violet,
                              ),
                            ),
                          ),
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // cancel button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: white,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: violet),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: violet,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              // booking button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentSuccess()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: violet,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text(
                                  "Buy",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                    primary: violet,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Divider(
        height: 12,
        thickness: 1,
        indent: 23,
        endIndent: 23,
        color: n20,
      ),
    );
  }
}
