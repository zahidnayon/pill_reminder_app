import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:sizer/sizer.dart';

class ExtendedInfoTab extends StatelessWidget {
  final String fieldTitle;
  final String fieldInfo;
  const ExtendedInfoTab({Key? key, required this.fieldTitle, required this.fieldInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(fieldTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: kTextColor,
              ),
            ),
          ),
          Text(fieldInfo,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
