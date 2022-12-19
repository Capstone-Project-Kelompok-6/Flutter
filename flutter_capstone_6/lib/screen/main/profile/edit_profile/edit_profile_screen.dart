import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
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

    changeProfile(fullName, phoneNumber, image, imageName, userToken);
  }

  Future<http.Response> changeProfile(String fullName, String phoneNumber,
      String image, String imageName, String token) async {
    try {
      var headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ' + token
      };
      var request = await http.patch(Uri.parse(api.BASE_URL + '/users'),
          body: jsonEncode({
            "full_name": fullName,
            'phone_number': phoneNumber,
            'image': image,
            'image_name': imageName
          }),
          headers: headers);
      return request;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  String? userEmail;
  String? fullName;
  String? phoneNumber;
  String? image;
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Consumer<LoginViewModel>(
          builder: (context, LoginViewModel data, child) {
        if (data.getDatas.isNotEmpty) {
          var userData = data.getDatas[0];
          userEmail = userData.data.email;
          fullName = userData.data.fullName;
          phoneNumber = userData.data.phoneNumber;
        }
        return Center(
          child: Column(
            children: [
              profilePicture(),
              SizedBox(
                height: 10,
              ),
              fullnameFormItem(),
              const SizedBox(height: 10),
              emailItem(),
              const SizedBox(height: 10),
              phoneNumberFormItem(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 32, bottom: 4),
                child: ElevatedButton(
                  onPressed: () {},
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
    );
  }

  Widget fullnameFormItem() {
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
          labelText: fullName,
          hintText: fullName,
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
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/profile_picture.png'))),
        ),
        Positioned(
          bottom: -9,
          right: 57,
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfileScreen()));
            },
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
