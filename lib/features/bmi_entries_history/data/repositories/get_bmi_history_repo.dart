import 'package:bmi_calculator/features/bmi_entries_history/data/data_sources/get_bmi_history_data_source.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_get_bmi_history_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/get_bmi_history_use_case.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';

class GetBmiHistoryRepo extends BaseGetBmiHistoryRepo {
  final BaseGetBmiHistoryDataSource baseGetBmiHistoryDataSource;

  GetBmiHistoryRepo({required this.baseGetBmiHistoryDataSource});
  @override
  Future<Stream<List<BmiEntryWithId>>> getBmiHistoryData(
      {required BmiGettingHistoryParameters
          bmiGettingHistoryParameters}) async {
    try {
      return baseGetBmiHistoryDataSource.getBmiHistoryData(
          bmiGettingHistoryParameters: bmiGettingHistoryParameters);
    } catch (e) {
      rethrow;
    }
  }
}
