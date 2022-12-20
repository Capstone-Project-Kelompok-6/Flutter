import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../component/api.dart';
import '../../../../component/colors.dart';
import '../../../../component/repository.dart';
import '../../../../model/user/user_model.dart';
import '../../../login/login_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ApiEndpoint api = ApiEndpoint();
  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var imageController = TextEditingController();
  var imageNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userToken =
        context.read<LoginViewModel>().getDatas.first.data.accessToken;
    final fullName =
        context.read<LoginViewModel>().getDatas.first.data.fullName;
    final phoneNumber =
        context.read<LoginViewModel>().getDatas.first.data.phoneNumber;
    final image = context.read<LoginViewModel>().getDatas.first.data.image;
    final imageName =
        context.read<LoginViewModel>().getDatas.first.data.imageName;
  }

  Future<http.Response> changeProfile(String firstName, String lastName,
      String phoneNumber, String image, String imageName, String token) async {
    print(fullName);
    try {
      var headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ' + token
      };
      var request = await http.patch(Uri.parse(api.BASE_URL + 'users'),
          body: jsonEncode({
            "first_name": firstName,
            "last_name": lastName,
            'phone_number': phoneNumber,
            'image': image,
            'image_name': imageName
          }),
          headers: headers);
      print(request.body);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  String? userEmail;
  String? fullName;
  String? phoneNumber;
  String? imageName;
  String? lastName;
  String? firstName;
  String? token;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Consumer<LoginViewModel>(
            builder: (context, LoginViewModel data, child) {
          if (data.getDatas.isNotEmpty) {
            var userData = data.getDatas[0];
            userEmail = userData.data.email;
            fullName = userData.data.fullName;
            phoneNumber = userData.data.phoneNumber;
            imageName = userData.data.imageName;
            token = userData.data.accessToken;
            image = userData.data.image;

            if (fullName!.split(" ").length > 1) {
              lastName = fullName!.substring(fullName!.lastIndexOf(" ") + 1);
              firstName = fullName!.substring(0, fullName!.lastIndexOf(" "));

              print('ini first: "$firstName"');
              print('ini last: "$lastName"');
            } else {
              firstName = fullName!;
            }
          }
          return Center(
            child: Column(
              children: [
                profilePicture(),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(right: 275),
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Text(
                      'first name',
                      style: TextStyle(),
                    )),
                firstNameFormItem(),
                const SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.only(right: 275),
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Text(
                      'last name',
                      style: TextStyle(),
                    )),
                lastNameFormItem(),
                const SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.only(right: 310),
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Text(
                      'email',
                      style: TextStyle(),
                    )),
                emailItem(),
                const SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.only(right: 250),
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Text(
                      'phone number',
                      style: TextStyle(),
                    )),
                phoneNumberFormItem(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 32, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      changeProfile(
                          firstNameController.text,
                          lastNameController.text,
                          phoneNumberController.text,
                          imageController.text,
                          imageNameController.text,
                          token!);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: violet,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      "Save Changes",
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
        }),
      ),
    );
  }

  Widget firstNameFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        controller: firstNameController,
        validator: (String? value) => value == '' ? "Required" : null,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z]")),
        ],
        decoration: InputDecoration(
          labelText: firstName,
          hintText: firstName,
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
        // controller: _controller.firstNameController,
        validator: (String? value) => value == '' ? "Required" : null,

        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z]")),
        ],
        decoration: InputDecoration(
          labelText: lastName,
          hintText: lastName,
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

  Widget emailItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: userEmail,
          hintText: userEmail,
          filled: true,
          enabled: false,
          labelStyle: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
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

  Widget profilePicture() {
    return Container(
      height: 200,
      child: Stack(children: <Widget>[
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage('$image'))),
        ),
        Positioned(
          bottom: -9,
          right: 57,
          child: IconButton(
            iconSize: 50,
            onPressed: () {},
            icon: SvgPicture.asset('assets/profile_change.svg'),

            // child: Container(
            //   height: 50,
            //   width: 180,
            //   decoration: BoxDecoration(
            //       color: Colors.blue,
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: AssetImage('assets/profile_change.svg'))),
            // ),
          ),
        )
        //   Container(
        //     width: 180,
        //     height: 180,
        //     decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //             image: AssetImage('assets/profile_picture.png'))),
        //   ),
        //   Positioned(
        //     bottom: -30,
        //     right: 60,
        //     child: SizedBox(
        //       height: 100,
        //       width: 56,
        //       child: IconButton(
        //           onPressed: () {},
        //           icon: SvgPicture.asset('assets/profile_change.svg')),
        //     ),
        //   ),
        // ]);
      ]),
    );
  }

  Widget phoneNumberFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        // controller: _controller.phoneNumberController,
        validator: (String? value) => value == '' ? "Required" : null,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        maxLines: 1,
        decoration: InputDecoration(
          labelText: phoneNumber,
          hintText: phoneNumber,
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
}
