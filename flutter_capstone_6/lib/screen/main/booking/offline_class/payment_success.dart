import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_done.dart';
import 'package:flutter_capstone_6/widget/bottom_navigation.dart';
import 'package:provider/provider.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({
    Key? key,
    required this.classTitle,
    required this.classInstructor,
  }) : super(key: key);
  final String classTitle;
  final String classInstructor;

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: violet,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset('assets/payment/payment_success.png'),
                const SizedBox(height: 30),
                const Text(
                  "Payment Successfull",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Wohooo! Now you can enjoy this features.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: n5,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationBarController(
                              token: context
                                  .read<LoginViewModel>()
                                  .getDatas
                                  .first
                                  .data
                                  .accessToken),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: white,
                      minimumSize: const Size(double.infinity, 48),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: violet,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingOfflineDone(
                                    classTitle: widget.classTitle,
                                    classInstructor: widget.classInstructor,
                                    createdAt: DateTime.now(),
                                    endClassDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month + 1,
                                        DateTime.now().day - 1),
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: violet,
                      minimumSize: const Size(double.infinity, 48),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: white)),
                    ),
                    child: const Text(
                      "Check Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )));
  }
}
