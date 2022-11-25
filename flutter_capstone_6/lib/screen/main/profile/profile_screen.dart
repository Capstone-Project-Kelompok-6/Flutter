import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_capstone_6/screen/main/profile/profile_providers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userFullname;
  String? userId;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    // Provider.of<ProfileProvider>(context, listen: false)
    //     .getProfile(widget.fullName);
  }

  @override
  Widget build(BuildContext context) {
    // final repoData = Provider.of<ProfileProvider>(context);
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
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Consumer<LoginViewModel>(
        builder: (context, LoginViewModel data, child) {
          if (data.getDatas.isNotEmpty) {
            var userData = data.getDatas[0];
            userFullname = userData.data.fullName;
            userId = userData.data.userId;
            userEmail = userData.data.email;
          }

          return ListView.builder(
            itemCount: data.getDatas.length,
            itemBuilder: (context, index) => Center(
              child: Column(children: [
                profilePicture(),
                const SizedBox(
                  height: 10,
                ),
                userAccount(),
                const SizedBox(
                  height: 24,
                ),
                buttonSection(context),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget profilePicture() {
    return Stack(children: [
      Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/profile_picture.png'))),
      ),
      Positioned(
        bottom: -5,
        right: 60,
        child: SizedBox(
          height: 56,
          width: 56,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/profile_change.svg')),
        ),
      ),
    ]);
  }

  Widget userAccount() {
    return Column(
      children: [
        Text(
          userFullname!,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          userEmail!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget buttonSection(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: double.infinity,
          height: 56,
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: n40,
                offset: Offset(0, 1),
              ),
              BoxShadow(color: white, offset: Offset(-10, 0)),
              BoxShadow(color: white, offset: Offset(5, 0))
            ]),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
                onPressed: () {},
                child: ListTile(
                  textColor: Colors.black,
                  leading: SvgPicture.asset('assets/trophy.svg'),
                  title: const Text(
                    'My Membership',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: n40,
                  offset: Offset(0, 1),
                ),
                BoxShadow(color: white, offset: Offset(-10, 0)),
                BoxShadow(color: white, offset: Offset(5, 0))
              ]),
              child: SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: whiteBg, elevation: 0),
                    onPressed: () {},
                    child: ListTile(
                      textColor: Colors.black,
                      leading: SvgPicture.asset('assets/phone.svg'),
                      title: const Text(
                        'Contact Us',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: n40,
                  offset: Offset(0, 1),
                ),
                BoxShadow(color: white, offset: Offset(-10, 0)),
                BoxShadow(color: white, offset: Offset(5, 0))
              ]),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
                  onPressed: () {},
                  child: ListTile(
                    textColor: Colors.black,
                    leading: SvgPicture.asset('assets/lock.svg'),
                    title: const Text(
                      'Privacy Policy',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: n40,
                  offset: Offset(0, 1),
                ),
                BoxShadow(color: white, offset: Offset(-10, 0)),
                BoxShadow(color: white, offset: Offset(5, 0))
              ]),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
                  onPressed: () {},
                  child: ListTile(
                    textColor: Colors.black,
                    leading: SvgPicture.asset('assets/shield.svg'),
                    title: const Text(
                      'Terms And Conditions',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => LoginScreen())));
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
}
