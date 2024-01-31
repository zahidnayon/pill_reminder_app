import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:pill_reminder_app/models/error.dart';
import 'package:pill_reminder_app/models/medicine.dart';
import 'package:pill_reminder_app/models/medicine_type.dart';
import 'package:pill_reminder_app/screens/new_entry/new_entry_bloc.dart';
import 'package:pill_reminder_app/screens/success_screen/success_screen.dart';
import 'package:pill_reminder_app/text_form_field/dosage_form.dart';
import 'package:pill_reminder_app/text_form_field/medicine_name_form.dart';
import 'package:pill_reminder_app/widgets/new_entry_screen/interval_selection.dart';
import 'package:pill_reminder_app/widgets/new_entry_screen/medicine_type_column.dart';
import 'package:pill_reminder_app/widgets/panel_title.dart';
import 'package:pill_reminder_app/widgets/new_entry_screen/select_time.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({Key? key}) : super(key: key);

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  late TextEditingController nameController;
  late TextEditingController dosageController;

  late GlobalKey<ScaffoldState> _scaffoldkey;
  late NewEntryBloc _newEntryBloc;

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameController = TextEditingController();
    dosageController = TextEditingController();

    _newEntryBloc = NewEntryBloc();
    _scaffoldkey = GlobalKey<ScaffoldState>();
    initializeErrorListen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add New Medicine"),
      ),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            //input form section
            children: [
              const PanelTitle(
                title: "Medicine Name",
                isRequired: true,
              ),
              SizedBox(
                height: 1.h,
              ),
              MedicineNameForm(
                controller: nameController,
              ),
              SizedBox(
                height: 1.h,
              ),
              const PanelTitle(
                title: "Dosage in mg",
                isRequired: false,
              ),
              SizedBox(
                height: 1.h,
              ),
              DosageForm(
                controller: dosageController,
              ),

              //medicine type section
              const PanelTitle(
                title: "Medicine Type",
                isRequired: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: StreamBuilder<MedicineType>(
                  //new entry bloc
                  stream: _newEntryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //clickable
                        MedicineTypeColumn(
                          name: "Syrup",
                          iconValue: 'assets/icons/bottle.svg',
                          isSelected: snapshot.data == MedicineType.Syrup
                              ? true
                              : false,
                          medicineType: MedicineType.Syrup,
                        ),
                        MedicineTypeColumn(
                          name: "Capsule",
                          iconValue: 'assets/icons/pill.svg',
                          isSelected:
                              snapshot.data == MedicineType.Capsule ? true : false,
                          medicineType: MedicineType.Capsule,
                        ),
                        MedicineTypeColumn(
                          name: "Tablet",
                          iconValue: 'assets/icons/tablet.svg',
                          isSelected: snapshot.data == MedicineType.Tablet
                              ? true
                              : false,
                          medicineType: MedicineType.Tablet,
                        ),
                        MedicineTypeColumn(
                          name: "Syringe",
                          iconValue: 'assets/icons/syringe.svg',
                          isSelected: snapshot.data == MedicineType.Syringe
                              ? true
                              : false,
                          medicineType: MedicineType.Syringe,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const PanelTitle(
                title: "Interval Selection",
                isRequired: false,
              ),
              const IntervalSelection(),
              const PanelTitle(
                title: "Starting Time",
                isRequired: true,
              ),
              const SelectTime(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: SizedBox(
                  width: 80.w,
                  height: 8.h,
                  child: TextButton(
                    onPressed: () {
                      String? medicineName;
                      int? dosage;
                      //medicineName
                      if (nameController.text == "") {
                        _newEntryBloc.submitError(EntryError.nameNull);
                        return;
                      }
                      if (nameController.text != "") {
                        medicineName = nameController.text;
                      }
                      //dosage
                      if (dosageController.text == "") {
                        dosage = 0;
                      }
                      if (dosageController.text != "") {
                        dosage = int.parse(dosageController.text);
                      }
                      for (var medicine in globalBloc.medicineList$!.value) {
                        if (medicineName == medicine.medicineName) {
                          _newEntryBloc.submitError(EntryError.nameDuplicate);
                          return;
                        }
                      }
                      if (_newEntryBloc.selectedIntervals!.value == 0) {
                        _newEntryBloc.submitError(EntryError.interval);
                        return;
                      }
                      if (_newEntryBloc.selectedTimeOfDay$!.value == "None") {
                        _newEntryBloc.submitError(EntryError.startTime);
                        return;
                      }

                      String medicineType = _newEntryBloc
                          .selectedMedicineType!.value
                          .toString()
                          .substring(13);

                      int interval = _newEntryBloc.selectedIntervals!.value;
                      String startTime =
                          _newEntryBloc.selectedTimeOfDay$!.value;

                      List<int> intIDs =
                          makeIDs(24 / _newEntryBloc.selectedIntervals!.value);
                      List<String> notificationIDs =
                          intIDs.map((i) => i.toString()).toList();

                      Medicine newEntryMedicine = Medicine(
                        notificationIDs: notificationIDs,
                        medicineName: medicineName,
                        dosage: dosage,
                        medicineType: medicineType,
                        interval: interval,
                        startTime: startTime,
                      );

                      //update medicine list via global bloc
                      globalBloc.updateMedicineList(newEntryMedicine);

                      //schedule notification

                      //go to success screen
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SuccessScreen()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kScaffoldColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$!.listen(
      (EntryError error) {
        if (error case EntryError.nameNull) {
          displayError("Please enter the medicine's name");
        } else if (error case EntryError.nameDuplicate) {
          displayError("Medicine name already exist");
        } else if (error case EntryError.dosage) {
          displayError("Please enter the dosage required");
        } else if (error case EntryError.interval) {
          displayError("Please select the reminder's interval");
        } else if (error case EntryError.startTime) {
          displayError("Please selet the reminder's starting time");
        }
      },
    );
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: kOtherColor,
      ),
    );
  }



}
