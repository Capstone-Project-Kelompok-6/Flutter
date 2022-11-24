import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              profilePicture(),
              SizedBox(
                height: 10,
              ),
              userAccount(),
              SizedBox(
                height: 24,
              ),
              buttonSection(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget profilePicture() {
    return Stack(children: [
      Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/profile_picture.png'))),
      ),
      Positioned(
        bottom: -5,
        right: 60,
        child: Container(
          height: 56,
          width: 56,
          child: IconButton(
              onPressed: () {},
              icon: Container(
                child: SvgPicture.asset('assets/profile_change.svg'),
              )),
        ),
      ),
    ]);
  }

  Widget userAccount() {
    return Column(
      children: [
        Text(
          'Zaskiaaa',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '9002210092331',
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
            decoration: BoxDecoration(boxShadow: [
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
                  title: Text(
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
              decoration: BoxDecoration(boxShadow: [
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
                      title: Text(
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
              decoration: BoxDecoration(boxShadow: [
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
                    title: Text(
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
              decoration: BoxDecoration(boxShadow: [
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
                    title: Text(
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
                  title: Text(
                    'LogOut',
                    style: TextStyle(
                        fontSize: 16, color: red, fontWeight: FontWeight.bold),
                  ),
                ))),
      ),
    ]);
  }
}
