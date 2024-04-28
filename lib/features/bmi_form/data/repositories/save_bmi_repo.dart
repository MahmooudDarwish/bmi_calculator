import 'package:bmi_calculator/features/bmi_form/data/data_sources/save_bmi_data_source.dart';
import 'package:bmi_calculator/features/bmi_form/domain/repositories/base_save_bmi_repo.dart';
import 'package:bmi_calculator/features/bmi_form/domain/use_cases/save_bmi_use_case.dart';

class SaveBmiRepo extends BaseSaveBmiRepo {
  final BaseSaveBmiDataSource baseSaveBmiDataSource;

  SaveBmiRepo({required this.baseSaveBmiDataSource});
  @override
  Future<void> saveBmiData(
      {required BmiSavingParameters bmiSavingParameters}) async {
    try {
      await baseSaveBmiDataSource.saveBmiData(
          bmiSavingParameters: bmiSavingParameters);
    } catch (e) {
      rethrow;
    }
  }
}
