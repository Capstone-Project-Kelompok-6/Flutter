import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar_register_verification.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterVerification extends StatefulWidget {
  const RegisterVerification({Key? key}) : super(key: key);

  @override
  State<RegisterVerification> createState() => _RegisterVerificationState();
}

class _RegisterVerificationState extends State<RegisterVerification> {
  // pin code
  var onTapRecognizer;
  TextEditingController pinController = TextEditingController();
  String pin = "";

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: const BoxDecoration(
            color: whiteBg,
          ),
          child: const AppBarContent(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: n40.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                // Title Section
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                      'assets/register_verification/register_verification.svg'),
                ),
                const Text(
                  "Email Verification",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: n100,
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Please check your email, we have send you the code",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Pin Code Section
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  width: 300,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        inactiveColor: n60,
                        activeColor: violet,
                        selectedColor: violet),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: n100,
                      height: 1.6,
                    ),
                    backgroundColor: white,
                    controller: pinController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        pin = value;
                      });
                    },
                  ),
                ),

                // Resend Section
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't get the code?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          " Resend code",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: violet,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
