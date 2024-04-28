import 'package:bmi_calculator/features/bmi_entries_history/data/data_sources/delete_bmi_entry_data_source.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_delete_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/delete_bmi_entry_use_case.dart';

class DeleteBmiEntryRepo extends BaseDeleteBmiEntryRepo {
  BaseDeleteBmiEntryDataSource baseDeleteBmiEntryDataSource;
  DeleteBmiEntryRepo({required this.baseDeleteBmiEntryDataSource});
  @override
  Future<void> deleteBmiEntry(
      {required BmiEntryDeletingParameters bmiEntryDeletingParameters}) async {
    try {
      await baseDeleteBmiEntryDataSource.deleteBmiEntry(
          bmiEntryDeletingParameters: bmiEntryDeletingParameters);
    } catch (e) {
      rethrow;
    }
  }
}

