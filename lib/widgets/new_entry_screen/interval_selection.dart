import 'package:flutter/material.dart';
import 'package:pill_reminder_app/color/constants.dart';
import 'package:pill_reminder_app/screens/new_entry/new_entry_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({Key? key}) : super(key: key);

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Remind Me Every",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: kPrimaryColor,
              ),
        ),
        DropdownButton(
          iconEnabledColor: kOtherColor,
          dropdownColor: kScaffoldColor,
          itemHeight: 8.h,
          hint: _selected == 0
              ? Text(
                  "Select an Interval",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : null,
          elevation: 2,
          value: _selected == 0 ? null : _selected,
          items: _intervals.map(
            (int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (newVal) {
            setState(() {
              _selected = newVal!;
              newEntryBloc.updateInterval(newVal);
            });
          },
        ),
        Text(_selected == 1 ? "hour" : "hours",
        style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
