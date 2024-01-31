import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:pill_reminder_app/screens/medicine_details/medicine_details.dart';
import 'package:sizer/sizer.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  //for getting the current details of the saved items

  //get the medicine type icon function
  Hero makeIcon(double size) {
    //
    if (medicine.medicineType == "Syrup") {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/bottle.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == "Capsule") {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/pill.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == "Tablet") {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/tablet.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine.medicineType == "Syringe") {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/syringe.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        //go to details activity with animation
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MedicineDetails(),
        //   ),
        // );
        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: MedicineDetails(medicine),
                  );
                },
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 2.w,
          top: 1.h,
          bottom: 2.h,
        ),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            //icon type function
            //later will solve icon issue
            makeIcon(7.h),
            const Spacer(),
            //hero tag animation
            Hero(
              tag: medicine.medicineName!,
              child: Padding(
                padding: EdgeInsets.only(left: 1.w),
                child: Text(
                  medicine.medicineName!,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SizedBox(
              height: 0.3.h,
            ),
            //time interval data with condition
            Padding(
              padding: EdgeInsets.only(left: 1.w),
              child: Text(
                medicine.interval == 1
                    ? "Every ${medicine.interval} hour"
                    : "Every ${medicine.interval} hour",
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kTextLightColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
