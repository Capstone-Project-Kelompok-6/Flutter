import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/home/notification_view_model.dart';
import 'package:flutter_capstone_6/screen/main/profile/edit_profile/image_view_model.dart';
import 'package:flutter_capstone_6/screen/main/profile/privacy_policy_screen.dart';
import 'package:flutter_capstone_6/screen/main/profile/term_condi_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile/edit_profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userFullname;
  String? userId;
  String? userEmail;
  String firstName = '';
  String lastName = '';
  String? image;
  File? imageFile;
  bool isEdit = false;

  late SharedPreferences storageData;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    storageData = await SharedPreferences.getInstance();
    setState(() {
      isEdit = storageData.getBool('isEdit')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: n100,
          ),
        ),
      ),
      body: Consumer<LoginViewModel>(
        builder: (context, LoginViewModel data, child) {
          if (data.getDatas.isNotEmpty) {
            var userData = data.getDatas[0];
            userFullname = userData.data.fullName;
            userId = userData.data.userId;
            userEmail = userData.data.email;

            if (userFullname!.split(" ").length > 1) {
              lastName =
                  userFullname!.substring(userFullname!.lastIndexOf(" ") + 1);
              firstName =
                  userFullname!.substring(0, userFullname!.lastIndexOf(" "));
            } else {
              firstName = userFullname!;
            }

            image = userData.data.image;
          }

          return SingleChildScrollView(
            child: Center(
              child: Column(children: [
                profilePicture(),
                const SizedBox(
                  height: 10,
                ),
                userAccount(),
                const SizedBox(
                  height: 24,
                ),
                buttonSection(context, data),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget profilePicture() {
    return SizedBox(
        height: 200,
        child: isEdit
            ? Stack(children: <Widget>[
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: FileImage(context
                              .read<ImageProfileViewModel>()
                              .getDatas
                              .first
                              .image!),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: -9,
                  right: 57,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                    },
                    icon: SvgPicture.asset('assets/profile_change.svg'),
                  ),
                )
              ])
            : Stack(children: <Widget>[
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(image!), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: -9,
                  right: 57,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                    },
                    icon: SvgPicture.asset('assets/profile_change.svg'),
                  ),
                )
              ]));
  }

  Widget userAccount() {
    return Column(
      children: [
        Text(
          userFullname!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          userEmail!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget buttonSection(BuildContext context, LoginViewModel data) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
            onPressed: () async {
              const url = "https://wa.me/6285296922134";
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
              } else {
                throw "Could not launch $url";
              }
            },
            child: ListTile(
              textColor: Colors.black,
              leading: SvgPicture.asset('assets/phone.svg'),
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: SvgPicture.asset(
          'assets/button_divider.svg',
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen()));
            },
            child: ListTile(
              textColor: Colors.black,
              leading: SvgPicture.asset('assets/lock.svg'),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: SvgPicture.asset(
          'assets/button_divider.svg',
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermCondiScreen()));
            },
            child: ListTile(
              textColor: Colors.black,
              leading: SvgPicture.asset('assets/shield.svg'),
              title: const Text(
                'Terms And Conditions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: SvgPicture.asset(
          'assets/button_divider.svg',
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
                onPressed: () {
                  logout(data);
                },
                child: ListTile(
                  textColor: Colors.black,
                  leading: SvgPicture.asset('assets/logout.svg'),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(
                        fontSize: 16, color: red, fontWeight: FontWeight.bold),
                  ),
                ))),
      ),
    ]);
  }

  logout(LoginViewModel data) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Are you sure?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: n100,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 220,
                  child: Text(
                    "You cannot enjoy our features if you log out",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: n60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            contentPadding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // cancel button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: white,
                    minimumSize: const Size(140, 48),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: violet),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: violet,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // booking button
                ElevatedButton(
                  onPressed: () {
                    data.deleteUser(0);
                    context.read<NotificationViewModel>().getDatas.clear();
                    storageData.setBool('notifEmpty', true);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => const LoginScreen())));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: violet,
                    minimumSize: const Size(140, 48),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
