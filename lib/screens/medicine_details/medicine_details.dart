import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:pill_reminder_app/widgets/details_screen_widgets/extended_section.dart';
import 'package:pill_reminder_app/widgets/details_screen_widgets/main_section.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  final Medicine medicine;

  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
            const Spacer(),
            SizedBox(
              width: 100.w,
              height: 7.h,
              child: TextButton(
                onPressed: () {
                  //open alert dialog box + global bloc
                  openAlertBox(context, _globalBloc);
                },
                child: Text(
                  "Delete",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: const StadiumBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  //delete a medicine from memory


  openAlertBox(BuildContext context,GlobalBloc _globalBloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Delete this reminder?",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                //global bloc to delete medicine
                _globalBloc.removeMedicine(widget.medicine);
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Text(
                "Okay",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
