import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone_6/screen/main/profile/profile_screen.dart';
import 'package:flutter_capstone_6/widget/bottom_navigation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../component/api.dart';
import '../../../../component/colors.dart';
import '../../../../model/user/user_data.dart';
import '../../../../model/user/user_token.dart';
import '../../../login/login_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ApiEndpoint api = ApiEndpoint();
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  PickedFile? _imageFile;
  var phoneNumberController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
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

  String? userEmail;
  String? fullName;
  String? phoneNumber;
  String? imageName;
  String? lastName;
  String? firstName;
  String? token;
  String? image;

  Future<http.StreamedResponse> updateProfile(
      PickedFile? datas,
      String firstName,
      String lastName,
      String phoneNumber,
      String token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.MultipartRequest('PATCH', Uri.parse(api.BASE_URL + 'users'));
    request.fields.addAll({
      'first_name': firstName,
      'phone_number': phoneNumber,
      'image_name': imageName.toString(),
      'last_name': lastName
    });
    if (datas != null) {
      File _file = File(datas.path);
      request.files.add(http.MultipartFile(
        'img',
        _file.readAsBytes().asStream(),
        _file.lengthSync(),
      ));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(image);
    final data = Provider.of<LoginViewModel>(context, listen: false);
    String userId = data.getDatas.first.data.userId;
    String email = data.getDatas.first.data.email;
    String accessToken = data.getDatas.first.data.accessToken;
    String refreshToken = data.getDatas.first.data.refreshToken;
    data.getDatas.removeAt(0);
    final userDetail = UserData(
        data: UserToken(
            userId: userId,
            fullName: firstName + ' ' + lastName,
            email: email,
            phoneNumber: phoneNumber,
            accessToken: accessToken,
            refreshToken: refreshToken,
            image: image!,
            imageName: imageName!));
    data.addUser(userDetail);
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: ((context) => BottomNavigationBarController(
    //           token: accessToken,
    //         ))));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/arrow_back.svg',
              ),
            ],
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
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
                      updateProfile(
                          _pickedFile,
                          firstNameController.text,
                          lastNameController.text,
                          phoneNumberController.text,
                          token!);

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
                                      'assets/icons/info_blue.svg',
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      ' Success',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: navy,
                                      ),
                                    ),
                                  ],
                                ),
                                titlePadding:
                                    const EdgeInsets.only(top: 16, bottom: 5),
                                contentPadding: const EdgeInsets.only(
                                    bottom: 16, left: 16, right: 16),
                                content: Text(
                                  'Update profile berhasil',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: n80,
                                  ),
                                ),
                              ));
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
        controller: lastNameController,
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
      child: _pickedFile != null
          ? Image.file(File(_pickedFile!.path))
          : Stack(children: <Widget>[
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
                  onPressed: () {
                    _pickImage();
                  },
                  icon: SvgPicture.asset('assets/profile_change.svg'),
                ),
              )
            ]),
    );
  }

  Widget phoneNumberFormItem() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: phoneNumberController,
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
