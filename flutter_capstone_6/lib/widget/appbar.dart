import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget appBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: n100,
      ),
    ),
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
  );
}
