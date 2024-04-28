import 'package:bmi_calculator/features/bmi_detailed_info/domain/use_cases/edit_bmi_entry_use_case.dart';

abstract class BaseEditBmiEntryRepo {
  Future<void> editBmiEntry(
      {required BmiEditingParameters bmiEditingParameters});
}
