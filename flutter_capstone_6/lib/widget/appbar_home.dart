import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/login/login_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppBarContent extends StatefulWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  String? userFullname;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Consumer<LoginViewModel>(
                  builder: (context, LoginViewModel data, child) {
                if (data.getDatas.isNotEmpty) {
                  var userData = data.getDatas[0];
                  userFullname = userData.data.fullName;
                }
                ;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey $userFullname',
                      style: TextStyle(
                        color: n100,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Let's Exercise",
                      style: TextStyle(
                        color: fontLightGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                );
              }),
              const Spacer(),
              SizedBox(
                height: 21.5,
                width: 18.5,
                child: SvgPicture.asset('assets/notification.svg'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
