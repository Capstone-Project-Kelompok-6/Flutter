import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarContent extends StatefulWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hey Rahul',
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
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: whiteBg,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: n40.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/home/notification.svg',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
