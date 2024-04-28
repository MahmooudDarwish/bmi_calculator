import 'package:bmi_calculator/features/bmi_detailed_info/data/data_sources/edit_bmi_entry_data_source.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/repositories/base_edit_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/use_cases/edit_bmi_entry_use_case.dart';

class EditBmiEntryRepo extends BaseEditBmiEntryRepo {
  BaseEditBmiEntryDataSource baseEditBmiEntryDataSource;

  EditBmiEntryRepo({required this.baseEditBmiEntryDataSource});
  @override
  Future<void> editBmiEntry(
      {required BmiEditingParameters bmiEditingParameters}) async {
    try {
      await baseEditBmiEntryDataSource.editBmiEntry(
          bmiEditingParameters: bmiEditingParameters);
    } catch (e) {
      rethrow;
    }
  }
}
