import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.popUntil(context, ModalRoute.withName("/"));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          "assets/animations/success.svg",
          fit: BoxFit.contain,
          height: 20.h,
          width: 20.w,
        ),
      ),
    );
  }
}
