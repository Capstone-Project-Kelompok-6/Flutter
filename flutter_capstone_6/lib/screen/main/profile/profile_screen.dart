import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_screen.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userFullname;
  String? userId;
  String? userEmail;
  String? image;
  String? imageName;

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
            image = userData.data.image;
            imageName = userData.data.imageName;
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

  Widget buttonSection(BuildContext context, LoginViewModel data) {
    return Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(primary: whiteBg, elevation: 0),
          onPressed: () {
            print('My membership');
          },
          child: ListTile(
            textColor: Colors.black,
            leading: SvgPicture.asset('assets/trophy.svg'),
            title: const Text(
              'My Membership',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )),
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
            onPressed: () {},
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
            onPressed: () {},
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
            style: ElevatedButton.styleFrom(primary: white, elevation: 0),
            onPressed: () {},
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
              borderRadius: BorderRadius.circular(15),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Are ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: violet,
                  ),
                ),
                Text(
                  'You ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: violet,
                  ),
                ),
                const Text(
                  "Sure?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: violet,
                  ),
                ),
              ],
            ),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            contentPadding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 12,
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => LoginScreen())));
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
