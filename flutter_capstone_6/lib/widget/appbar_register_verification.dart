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
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/icons/arrow_back.svg'),
                  ),
                ),
              ),
              const Flexible(
                flex: 9,
                child: Center(
                  child: Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: n100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
