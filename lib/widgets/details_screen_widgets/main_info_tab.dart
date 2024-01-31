import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainInfoTab extends StatelessWidget {

  final String fieldTitle;
  final String fieldInfo;
  const MainInfoTab({Key? key, required this.fieldTitle, required this.fieldInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}
