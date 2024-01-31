import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:pill_reminder_app/screens/home_screens.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PillReminderApp extends StatefulWidget {
  const PillReminderApp({Key? key}) : super(key: key);

  @override
  State<PillReminderApp> createState() => _PillReminderAppState();
}

class _PillReminderAppState extends State<PillReminderApp> {
  GlobalBloc? globalBloc;
  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: "Pill Reminder",
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            //theme customization
            theme: ThemeData.dark().copyWith(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor,
              //appbar theme
              appBarTheme: AppBarTheme(
                  toolbarHeight: 7.h,
                  backgroundColor: kScaffoldColor,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: kSecondaryColor,
                    size: 20.sp,
                  ),
                  titleTextStyle: GoogleFonts.mulish(
                    color: kTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                  )),
              textTheme: TextTheme(
                  headlineLarge: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: kTextColor,
                  ),
                  headlineMedium: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.green,
                  ),
                  headlineSmall: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                  titleSmall: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: kTextLightColor,
                  ),
                  labelMedium: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                  labelSmall: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                  labelLarge: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: kTextColor,
                  ),
                  bodySmall:GoogleFonts.poppins(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  )
              ),
              //customize time picker theme
              // timePickerTheme: TimePickerThemeData(
              //   backgroundColor: kScaffoldColor,
              //   hourMinuteColor: kTextColor,
              //   hourMinuteTextColor: kScaffoldColor,
              //   dayPeriodColor: kTextColor,
              //   dayPeriodTextColor: kScaffoldColor,
              //   dialBackgroundColor: kTextColor,
              //   dialHandColor: kPrimaryColor,
              //   dialTextColor: kScaffoldColor,
              //   entryModeIconColor: kOtherColor,
              //   dayPeriodTextStyle: GoogleFonts.aBeeZee(
              //     fontSize: 8.sp,
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
