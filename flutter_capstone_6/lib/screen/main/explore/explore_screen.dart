import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      body: Column(children: [Center(child: Text('Halooo Explore'))]),
    );
  }
}
