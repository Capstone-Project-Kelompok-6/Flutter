import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar_reset_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: const BoxDecoration(
            color: whiteBg,
          ),
          child: const AppBarContentRP(),
        ),
      ),
    );
  }
}
