import 'package:pill_reminder_app/models/error.dart';
import 'package:pill_reminder_app/models/medicine_type.dart';
import 'package:rxdart/rxdart.dart';

class NewEntryBloc {
  BehaviorSubject<MedicineType>? _selectMedicineType$;

  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectMedicineType$!.stream;

  BehaviorSubject<int>? _selectedIntervals$;

  BehaviorSubject<int>? get selectedIntervals => _selectedIntervals$;

  BehaviorSubject<String>? _selectedTimeOfDay$;

  BehaviorSubject<String>? get selectedTimeOfDay$ => _selectedTimeOfDay$;

  //error state
  BehaviorSubject<EntryError>? _errorState$;

  BehaviorSubject<EntryError>? get errorState$ => _errorState$;

  NewEntryBloc() {
    _selectMedicineType$ =
        BehaviorSubject<MedicineType>.seeded(MedicineType.None);

    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded("none");

    _selectedIntervals$ = BehaviorSubject<int>.seeded(0);

    _errorState$ = BehaviorSubject<EntryError>();
  }

  void dispose() {
    _selectMedicineType$!.close();
    _selectedIntervals$!.close();
    _selectedTimeOfDay$!.close();
  }

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateInterval(int interval) {
    _selectedIntervals$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType type) {
    MedicineType _tempType = _selectMedicineType$!.value;
    if (type == _tempType) {
      _selectMedicineType$!.add(MedicineType.None);
    } else {
      _selectMedicineType$!.add(type);
    }
  }
}
