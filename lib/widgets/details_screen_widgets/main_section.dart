import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:pill_reminder_app/widgets/details_screen_widgets/main_info_tab.dart';
import 'package:sizer/sizer.dart';

class MainSection extends StatelessWidget {
  final Medicine? medicine;

  const MainSection({Key? key, this.medicine}) : super(key: key);

  Hero makeIcon(double size) {
    if (medicine!.medicineType == "Syrup") {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/bottle.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == "Capsule") {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/pill.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == "Tablet") {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          "assets/icons/tablet.svg",
          // ignore: deprecated_member_use
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == "Syringe") {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
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
      tag: medicine!.medicineName! + medicine!.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //lets try another
        //some problem here.solve later
        makeIcon(7.h),
        SizedBox(
          width: 2.w,
        ),
        Column(
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                  fieldTitle: "Medicine Name",
                  fieldInfo: medicine!.medicineName!,
                ),
              ),
            ),
            MainInfoTab(
                fieldTitle: "Dosage",
                fieldInfo: medicine!.dosage == 0
                    ? "Not Specified"
                    : "${medicine!.dosage}mg"),
          ],
        ),
      ],
    );
  }
}
