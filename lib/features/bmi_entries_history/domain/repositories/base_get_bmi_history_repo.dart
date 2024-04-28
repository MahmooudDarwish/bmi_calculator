import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/get_bmi_history_use_case.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';

abstract class BaseGetBmiHistoryRepo {
  Future<Stream<List<BmiEntryWithId>>> getBmiHistoryData(
      {required BmiGettingHistoryParameters bmiGettingHistoryParameters});
}
