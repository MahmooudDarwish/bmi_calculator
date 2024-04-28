import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/delete_bmi_entry_use_case.dart';

abstract class BaseDeleteBmiEntryRepo {
  Future<void> deleteBmiEntry(
      {required BmiEntryDeletingParameters bmiEntryDeletingParameters});
}
