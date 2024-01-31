import 'package:flutter/material.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:pill_reminder_app/widgets/home_screen_widgets/medicine_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //if no data saved
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No Medicine",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 1.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(
               medicine: snapshot.data![index]
              );
            },
          );
        }
      },
    );
  }
}
