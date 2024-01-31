import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:sizer/sizer.dart';

class PanelTitle extends StatelessWidget {
  final String title;
  final bool isRequired;

  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kPrimaryColor,
              ),
            ),
            TextSpan(
              text: isRequired? "*" : "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
