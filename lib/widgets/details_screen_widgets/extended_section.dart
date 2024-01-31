import 'package:flutter/material.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:pill_reminder_app/widgets/details_screen_widgets/extended_info_tab.dart';

class ExtendedSection extends StatelessWidget {
  final Medicine? medicine;

  const ExtendedSection({Key? key, this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTab(
          fieldTitle: "Medicine Type",
          fieldInfo: medicine!.medicineType! == "None"
              ? "Not Specified"
              : medicine!.medicineType!,
        ),
        ExtendedInfoTab(
          fieldTitle: "Dose Interval",
          fieldInfo:
              "Every ${medicine!.interval} hours | ${medicine!.interval == 24 ? "One time a day" : "${(24 / medicine!.interval!).floor()}times a day"}",
        ),
        ExtendedInfoTab(
          fieldTitle: "Start Time",
          fieldInfo:
              "${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}",
        ),
      ],
    );
  }
}
