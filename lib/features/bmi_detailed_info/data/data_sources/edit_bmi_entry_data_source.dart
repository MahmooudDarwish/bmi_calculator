import 'package:bmi_calculator/core/services/firebase_service.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/use_cases/edit_bmi_entry_use_case.dart';

abstract class BaseEditBmiEntryDataSource {
  Future<void> editBmiEntry(
      {required BmiEditingParameters bmiEditingParameters});
}

class EditBmiEntryDataSource extends BaseEditBmiEntryDataSource {
  @override
  Future<void> editBmiEntry(
      {required BmiEditingParameters bmiEditingParameters}) async {
    try {
      await FirebaseService.updateData(
          userId: bmiEditingParameters.userId,
          updatedBmiEntry: bmiEditingParameters.bmiEntryWithId);
    } catch (e) {
      rethrow;
    }
  }
}
