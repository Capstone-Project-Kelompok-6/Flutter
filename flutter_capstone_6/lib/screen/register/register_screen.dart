import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/component/repository.dart';
import 'package:flutter_capstone_6/model/user_model.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/register/register_controller.dart';
import 'package:flutter_capstone_6/screen/register/register_verification_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool isHide = true;
  bool isChecked = false;

  RegisterController _controller = RegisterController();

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
                        'Create a new account',
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
                        "Create an account so you can mantain your healthy life.",
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
                      child: SvgPicture.asset(
                          'assets/register/register_screen.svg'),
                    ),
                    const SizedBox(height: 15),
                    firstNameFormItem(),
                    const SizedBox(height: 15),
                    lastNameFormItem(),
                    const SizedBox(height: 15),
                    phoneNumberFormItem(),
                    const SizedBox(height: 15),
                    emailFormItem(),
                    const SizedBox(height: 15),
                    passwordFormItem(),
                    const SizedBox(height: 15),
                    // confirmPasswordFormItem(),
                    // const SizedBox(height: 24),
                  ],
                ),
              ),

              // Agree Privacy Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          value: isChecked,
                          checkColor: white,
                          fillColor:
                              MaterialStateColor.resolveWith((states) => n60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          side: const BorderSide(
                            width: 1,
                            color: n60,
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 320,
                      child: RichText(
                        text: const TextSpan(
                            text: 'By continuing you accept our ',
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 15,
                              color: n60,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Term of Use',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),

              // Button Register Section
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 32, bottom: 4),
                child: ElevatedButton(
                  onPressed: () {
                    _register();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: violet,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    "Register",
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
              // anotherRegisterItem('assets/icons/google_logo.png', 'Google'),
              // const SizedBox(height: 24),
              // anotherRegisterItem('assets/icons/facebook_logo.png', 'Facebook'),
              // const SizedBox(height: 24),
              // anotherRegisterItem('assets/icons/apple_logo.png', 'Apple'),

              // Goto login
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
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
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        " Login",
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

  Widget firstNameFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: _controller.firstNameController,
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        decoration: const InputDecoration(
          labelText: 'first name',
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

  Widget lastNameFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: _controller.lastNameController,
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        decoration: const InputDecoration(
          labelText: 'last name',
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

  Widget phoneNumberFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: _controller.phoneNumberController,
        validator: (String? value) => value == '' ? "Required" : null,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        // controller: _titleController,
        maxLines: 1,
        decoration: const InputDecoration(
          labelText: 'phone number',
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

  Widget emailFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: _controller.emailController,
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        decoration: const InputDecoration(
          labelText: 'new email address',
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
        validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'new password',
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

  Widget confirmPasswordFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 50,
      child: TextFormField(
        // validator: (String? value) => value == '' ? "Required" : null,
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
        maxLines: 1,
        obscureText: isHide,
        decoration: InputDecoration(
          labelText: 'confirmation password',
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

  Widget anotherRegisterItem(String image, String title) {
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
          "Register with $title",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: n80,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        onTap: () {
          if (title == 'Google') {
            print('this register by $title');
          } else if (title == 'Facebook') {
            print('this register by $title');
          } else if (title == 'Apple') {
            print('this register by $title');
          }
        },
      ),
    );
  }

  Future _register() async {
    if (formKey.currentState!.validate()) {
      if (isChecked) {
        UserModel response = await _controller.register();

        if (response.data == null) {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => AlertDialog(
          //     title: Text('Info Regist'),
          //     content: Text('${response.message}, please verify OTP code'),
          //   ),
          // );
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            Repository sendOtp = Repository();
            sendOtp.sendOtp(_controller.emailController.text);
            return RegisterVerificationScreen(
              email: _controller.emailController.text,
              password: _controller.passwordController.text,
            );
          })));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('INFO REGISTER'),
                    content: Text(response.message),
                  ));
        }

        debugPrint('Response = ${response.message}');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
                  title: Center(child: Text("INFO")),
                  content: Text(
                    'Please accept our Privacy Policy and Term of Use to continue.',
                    textAlign: TextAlign.center,
                  ),
                ));
      }
    }
  }
}
