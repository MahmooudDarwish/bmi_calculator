import 'package:bmi_calculator/core/services/firebase_service.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/delete_bmi_entry_use_case.dart';

abstract class BaseDeleteBmiEntryDataSource {
  Future<void> deleteBmiEntry(
      {required BmiEntryDeletingParameters bmiEntryDeletingParameters});
}

class DeleteBmiEntryDataSource extends BaseDeleteBmiEntryDataSource {
  @override
  Future<void> deleteBmiEntry(
      {required BmiEntryDeletingParameters bmiEntryDeletingParameters}) async {
    try {
      await FirebaseService.deleteData(
          bmiEntryId: bmiEntryDeletingParameters.bmiEntryId,
          userId: bmiEntryDeletingParameters.userId);
    } catch (e) {
      rethrow;
    }
  }
}
