import 'package:flutter/material.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            "Worry Less. \nLive Healthier.",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            "Welcome to daily Dose.",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        //show number of saved medicines from shared preference
        StreamBuilder<List<Medicine>>(
          stream: globalBloc.medicineList$,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text(
                !snapshot.hasData ? "0" : snapshot.data!.length.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          },
        ),
      ],
    );
  }
}
