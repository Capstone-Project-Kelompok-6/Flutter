import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/forgot_password/forgot_password_controller.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../component/repository.dart';

class ForgotPasswordVerificationScreen extends StatefulWidget {
  final String email;
  final String password;
  final String confirmPassword;
  final String pin;
  const ForgotPasswordVerificationScreen(
      {Key? key,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.pin})
      : super(key: key);

  @override
  State<ForgotPasswordVerificationScreen> createState() =>
      _ForgotPasswordVerificationScreenState();
}

class _ForgotPasswordVerificationScreenState
    extends State<ForgotPasswordVerificationScreen> {
  var onTapRecognizer;
  late ForgotPasswordController _controller = ForgotPasswordController();
  String pin = "";
  bool isComplete = false;
  bool isHide = true;
  bool isAccountBack = true;
  bool isLoading = false;
  bool isInit = true;
  bool onProgress = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    super.initState();
    _controller.emailController.text = widget.email;
    _controller.pinController.text = widget.pin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        title: isComplete
            ? isAccountBack
                ? Container()
                : const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: n100,
                    ),
                  )
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
        leading: isAccountBack
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
              child: isInit
                  ? codeVerification()
                  : isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : isAccountBack
                          ? resetPassword()
                          : successVerification()),
        ),
      ),
    );
  }

  Widget successVerification() {
    return Column(
      children: [
        // Title Section
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: SvgPicture.asset('assets/forgot_password/account_back.svg'),
        ),
        const SizedBox(height: 8),
        const Text(
          "Your Account is Back",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: n100,
          ),
        ),
        const SizedBox(
          width: 300,
          child: Text(
            "Password has been successfully changed",
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

  Widget resetPassword() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Title Section
          SizedBox(
            width: double.infinity,
            child:
                SvgPicture.asset('assets/forgot_password/forgot_password.svg'),
          ),
          const SizedBox(height: 8),
          const Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: n100,
            ),
          ),

          // Reset Pass Form Section
          const SizedBox(height: 22),
          newPasswordFormItem(),
          const SizedBox(height: 8),
          confirmPasswordFormItem(),
          const SizedBox(height: 25),

          // Button Send Section
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 32),
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (_controller.confirmPassController.text ==
                      _controller.passwordController.text) {
                    print(_controller.emailController.text);
                    print(_controller.pinController.text);
                    print(_controller.confirmPassController.text);
                    print(_controller.passwordController.text);
                    _controller.changePassword(
                        _controller.emailController.text,
                        _controller.passwordController.text,
                        _controller.confirmPassController.text,
                        _controller.pinController.text);
                    setState(() {
                      isAccountBack = false;
                    });
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/info_red2.svg',
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    ' Error',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: red,
                                    ),
                                  ),
                                ],
                              ),
                              titlePadding:
                                  const EdgeInsets.only(top: 16, bottom: 5),
                              contentPadding: const EdgeInsets.only(
                                  bottom: 16, left: 16, right: 16),
                              content: const Text(
                                'Your password and confirm password not match',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: n80,
                                ),
                              ),
                            ));
                  }
                }
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
    );
  }

  Widget newPasswordFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          if (value.contains(" ")) {
            return "Password contain space";
          }
          if (value.length < 8) {
            return "min password length 8";
          }
        },
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        controller: _controller.passwordController,
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'new password',
          labelStyle: const TextStyle(
              fontSize: 14, color: n40, fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(color: n100),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: n100),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isHide = !isHide;
                });
              },
              child: isHide
                  ? SvgPicture.asset('assets/icons/password_show.svg')
                  : SvgPicture.asset('assets/icons/password_hide.svg'),
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmPasswordFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          if (value.contains(" ")) {
            return "Password contain space";
          }
        },
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        controller: _controller.confirmPassController,
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'confirmation password',
          labelStyle: const TextStyle(
              fontSize: 14, color: n40, fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(color: n100),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: n100),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isHide = !isHide;
                });
              },
              child: isHide
                  ? SvgPicture.asset('assets/icons/password_show.svg')
                  : SvgPicture.asset('assets/icons/password_hide.svg'),
            ),
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
          child: SvgPicture.asset('assets/forgot_password/forgot_password.svg'),
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
            controller: _controller.pinController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            onCompleted: (v) {
              print("Completed");
              setState(() {
                isInit = false;
                isLoading = true;
                Repository verifyOtp = Repository();
                verifyOtp.verifyOtp(widget.email, pin).then((value) {
                  isLoading = false;
                  if (value) {
                    isComplete = true;
                  } else {
                    isComplete = false;
                  }
                  setState(() {});
                });
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

  // Widget failureVerification() {
  //   return Column(
  //     children: [
  //       // Title Section
  //       Container(
  //         margin: const EdgeInsets.symmetric(vertical: 10),
  //         width: double.infinity,
  //         child: SvgPicture.asset(
  //             'assets/register_verification/verification_success.svg'),
  //       ),
  //       const SizedBox(height: 8),
  //       const Text(
  //         "Verification Failed",
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.w600,
  //           color: n100,
  //         ),
  //       ),
  //       const SizedBox(
  //         width: 300,
  //         child: Text(
  //           "Your account is already registered",
  //           style: TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.w400,
  //             color: n60,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),

  //       // Button Next Section
  //       Container(
  //         margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 56),
  //         child: ElevatedButton(
  //           onPressed: () {
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: (context) => const LoginScreen()));
  //           },
  //           style: ElevatedButton.styleFrom(
  //               primary: violet,
  //               minimumSize: const Size(double.infinity, 48),
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(20))),
  //           child: const Text(
  //             "Next",
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.w500,
  //               color: white,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
