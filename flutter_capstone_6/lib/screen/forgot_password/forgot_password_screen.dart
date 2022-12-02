import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/forgot_password/forgot_password_verification_screen.dart';
import 'package:flutter_capstone_6/widget/appbar_forgot_password.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: n100,
          ),
        ),
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        leading: GestureDetector(
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
            child: Column(
              children: [
                // Title Section
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                      'assets/forgot_password/forgot_password.svg'),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Trouble logging in?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: n100,
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Enter your email and we'll send you code to get back into your account",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Email Form Section
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 24),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  height: 50,
                  child: TextFormField(
                    validator: (String? value) =>
                        value == '' ? "Required" : null,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    // controller: _titleController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'email address',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: n40,
                          fontWeight: FontWeight.w400),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelStyle: TextStyle(color: n100),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: n100),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),

                // Button Send Section
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordVerificationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: violet,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      "Send",
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
        ),
      ),
    );
  }
}
