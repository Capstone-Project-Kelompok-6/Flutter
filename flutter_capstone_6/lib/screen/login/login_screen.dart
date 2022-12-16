import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/user/user_data.dart';
import 'package:flutter_capstone_6/model/user/user_token.dart';
import 'package:flutter_capstone_6/screen/login/login_controller.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/register/register_screen.dart';
import 'package:flutter_capstone_6/widget/bottom_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../model/user/user_model.dart';
import '../forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isHide = true;
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Hey, welcome back.',
                        style: TextStyle(
                          color: n100,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "I am so happy to see you. Here, you can continue to manage your healthy life.",
                        maxLines: 2,
                        style: TextStyle(
                          color: fontLightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Login Form Section
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: SvgPicture.asset('assets/login/login_screen.svg'),
                    ),
                    const SizedBox(height: 15),
                    emailFormItem(),
                    const SizedBox(height: 15),
                    passwordFormItem(),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),

              // Forgot Password Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordScreen()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: violet,
                    ),
                  ),
                ),
              ),

              // Button Login Section
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 32, bottom: 4),
                child: ElevatedButton(
                  onPressed: () {
                    _login(_controller.emailController.text,
                        _controller.passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: violet,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ),
                ),
              ),

              // Divider
              // Container(
              //   margin: const EdgeInsets.all(20),
              //   width: double.infinity,
              //   child: SvgPicture.asset(
              //     'assets/icons/divider.svg',
              //     fit: BoxFit.cover,
              //   ),
              // ),

              // Login with Another
              // const SizedBox(height: 4),
              // anotherLoginItem('assets/icons/google_logo.png', 'Google'),
              // const SizedBox(height: 24),
              // anotherLoginItem('assets/icons/facebook_logo.png', 'Facebook'),
              // const SizedBox(height: 24),
              // anotherLoginItem('assets/icons/apple_logo.png', 'Apple'),

              // Goto register
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: n80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        " Register now",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: violet,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _controller.emailController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
        },
        maxLines: 1,
        decoration: const InputDecoration(
          labelText: 'email address',
          labelStyle:
              TextStyle(fontSize: 14, color: n40, fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: TextStyle(color: n100),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: n100),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget passwordFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: _controller.passwordController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
        },
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'password',
          labelStyle: const TextStyle(
              fontSize: 14, color: n40, fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(color: n100),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: n100),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
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

  Widget anotherLoginItem(String image, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      height: 54,
      child: ListTile(
        tileColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              style: BorderStyle.solid,
              color: n5,
            )),
        leading: Image.asset(image, width: 30, height: 30),
        title: Text(
          "Login with $title",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: n80,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        onTap: () {
          if (title == 'Google') {
            print('this login by $title');
          } else if (title == 'Facebook') {
            print('this login by $title');
          } else if (title == 'Apple') {
            print('this login by $title');
          }
        },
      ),
    );
  }

  void _login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      UserModel response = await _controller.login();
      UserData userData = await _controller.getUser();
      // if (userData.data.email == '') {
      //   Repository sendOtp = Repository();
      //   sendOtp.sendOtp(email);
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: ((context) => RegisterVerificationScreen(
      //             email: email,
      //             password: password,
      //           ))));
      //   return;
      // }

      if (response.data != null) {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => RegisterVerificationScreen(
        //           email: '',
        //           password: '',
        //         )));

        // State Management
        final data = Provider.of<LoginViewModel>(context, listen: false);
        final userDetail = UserData(
            data: UserToken(
          userId: userData.data.userId,
          fullName: userData.data.fullName,
          email: userData.data.email,
          phoneNumber: userData.data.phoneNumber,
          accessToken: userData.data.accessToken,
          refreshToken: userData.data.refreshToken,
        ));
        data.addUser(userDetail);
        print('User fullname: ${userData.data.fullName}');
        print('User access token: ${userData.data.accessToken}');

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarController(
                      token: userData.data.accessToken,
                    )));

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //           title: const Center(child: Text('INFO LOGIN')),
        //           content: Text(
        //             response.message,
        //             textAlign: TextAlign.center,
        //           ),
        //         ));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Center(child: Text('INFO LOGIN')),
                  content: Text(
                    response.message,
                    textAlign: TextAlign.center,
                  ),
                ));
        debugPrint('Response ${response.message}');
      }
    }
  }
}
