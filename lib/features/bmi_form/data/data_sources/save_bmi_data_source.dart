import 'package:bmi_calculator/core/services/firebase_service.dart';
import 'package:bmi_calculator/features/bmi_form/domain/use_cases/save_bmi_use_case.dart';

abstract class BaseSaveBmiDataSource {
  Future<void> saveBmiData({required BmiSavingParameters bmiSavingParameters});
}

class SaveBmiDataSource implements BaseSaveBmiDataSource {
  @override
  Future<void> saveBmiData(
      {required BmiSavingParameters bmiSavingParameters}) async {
    try {

      await FirebaseService.saveData(
          userId: bmiSavingParameters.userId,
          bmiEntry: bmiSavingParameters.bmiEntry);
    } catch (e) {
      rethrow;
    }
  }
}
