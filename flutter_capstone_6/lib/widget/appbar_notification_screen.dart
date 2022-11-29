import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarContentNF extends StatefulWidget {
  const AppBarContentNF({Key? key}) : super(key: key);

  @override
  State<AppBarContentNF> createState() => _AppBarContentNFState();
}

class _AppBarContentNFState extends State<AppBarContentNF> {
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
                  child: SizedBox(
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
                    "Notification",
                    style: TextStyle(
                      fontSize: 18,
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
