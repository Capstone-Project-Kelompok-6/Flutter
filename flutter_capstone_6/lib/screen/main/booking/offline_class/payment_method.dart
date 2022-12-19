import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/component/currency.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/payment_detail.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod(
      {Key? key,
      required this.classTitle,
      required this.classInstructor,
      required this.price})
      : super(key: key);
  final String classTitle;
  final String classInstructor;
  final int price;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Payment'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // detail payment section
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
                    "Detail Payment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Class",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Instructor",
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
                      const SizedBox(width: 62),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.classTitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.classInstructor,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: n100,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            CurrencyFormat.convertToIdr(widget.price, 0),
                            style: const TextStyle(
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
            const SizedBox(height: 24),

            // payment method
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
                  // Select Payment Method
                  const Text(
                    "Select Payment Method",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  paymentMethod("dana.png", "Dana", 1),
                  divider(),
                  paymentMethod("gopay.png", "Gopay", 2),
                  divider(),
                  paymentMethod("ovo.png", "Ovo", 3),
                  divider(),
                  paymentMethod("spay.png", "ShopeePay", 4),
                  divider(),
                  paymentMethod("linkaja.png", "Linkaja", 5),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentDetail(
                                rValue: radioValue,
                                price: widget.price,
                                classTitle: widget.classTitle,
                                classInstructor: widget.classInstructor,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    primary: violet,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Continue",
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
    return const Divider(
      height: 12,
      thickness: 1,
      indent: 58,
      endIndent: 35,
      color: n20,
    );
  }

  Widget paymentMethod(String image, String title, int rValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/payment/$image'),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: n100,
              ),
            )
          ],
        ),
        Radio(
          value: rValue,
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value as int;
              print('rValue: $radioValue');
            });
          },
        )
      ],
    );
  }
}
