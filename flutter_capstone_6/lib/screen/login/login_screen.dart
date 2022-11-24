import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHide = true;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset('assets/login/login_screen.svg'),
                  ),
                  const SizedBox(height: 15),
                  emailFormItem(),
                  const SizedBox(height: 15),
                  passwordFormItem(),
                  const SizedBox(height: 10),
                ],
              ),

              // Forgot Password Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
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
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 35),
                child: ElevatedButton(
                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }

  Widget emailFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 50,
      child: TextFormField(
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        decoration: const InputDecoration(
          labelText: 'Email address',
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
      height: 50,
      child: TextFormField(
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'Password',
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
                  ? SvgPicture.asset('assets/icons/password_unfocus.svg')
                  : SvgPicture.asset('assets/icons/password_focus.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
