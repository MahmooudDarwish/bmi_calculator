import 'package:bmi_calculator/features/bmi_form/domain/use_cases/save_bmi_use_case.dart';

abstract class BaseSaveBmiRepo {
  Future<void> saveBmiData({required BmiSavingParameters bmiSavingParameters});
}
