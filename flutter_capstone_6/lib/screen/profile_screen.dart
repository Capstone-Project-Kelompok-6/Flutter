import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            'Profile',
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Stack(children: [
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
        ]),
        SizedBox(
          height: 10,
        ),
        Text(
          'Zaskiaaa',
          style: GoogleFonts.plusJakartaSans(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '9002210092331',
          style: GoogleFonts.plusJakartaSans(
              fontSize: 15, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    'My Membership',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/trophy.svg'),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    'Contact Us',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/phone.svg'),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    'Privacy Policy',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/lock.svg'),
                  ))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(),
          margin: EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    'Terms And Conditions',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/shield.svg'),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    'Log Out',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset('assets/logout.svg'),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
