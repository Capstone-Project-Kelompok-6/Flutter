import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterVerificationScreen extends StatefulWidget {
  const RegisterVerificationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterVerificationScreen> createState() =>
      _RegisterVerificationScreenState();
}

class _RegisterVerificationScreenState
    extends State<RegisterVerificationScreen> {
  // pin code
  var onTapRecognizer;
  TextEditingController pinController = TextEditingController();

  String pin = "";
  bool isComplete = false;

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
      appBar: AppBar(
        title: isComplete
            ? Container()
            : const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: n100,
                ),
              ),
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        leading: isComplete
            ? Container()
            : GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                    ),
                  ],
                ),
              ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 3),
          width: double.infinity,
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
            child: isComplete ? successVerification() : codeVerification(),
          ),
        ),
      ),
    );
  }

  Widget codeVerification() {
    return Column(
      children: [
        // Title Section
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
              'assets/register_verification/register_verification.svg'),
        ),
        const SizedBox(height: 8),
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
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
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
              setState(() {
                isComplete = true;
              });
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
        const SizedBox(height: 17),
      ],
    );
  }

  Widget successVerification() {
    return Column(
      children: [
        // Title Section
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: SvgPicture.asset(
              'assets/register_verification/verification_success.svg'),
        ),
        const SizedBox(height: 8),
        const Text(
          "Verification Success",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: n100,
          ),
        ),
        const SizedBox(
          width: 300,
          child: Text(
            "Your account is already registered",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: n60,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Button Next Section
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 56),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            style: ElevatedButton.styleFrom(
                primary: violet,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
