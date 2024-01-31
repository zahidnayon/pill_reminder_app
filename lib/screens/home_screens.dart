import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/screens/new_entry/new_entry_screen.dart';
import 'package:pill_reminder_app/widgets/home_screen_widgets/bottom_container.dart';
import 'package:pill_reminder_app/widgets/home_screen_widgets/top_container.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(2.h),
          child: const Column(
            children: [
              TopContainer(),
              Flexible(child: BottomContainer()),
            ],
          ),
        ),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewEntryScreen(),
              ),
          );
        },
        child: Card(
          color: kPrimaryColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Icon(
            Icons.add_outlined,
            color: kScaffoldColor,
            size: 50.sp,
          ),
        ),
      ),
    );
  }
}
