import 'package:bmi_calculator/shared/entities/bmi_entry.dart';
import 'package:bmi_calculator/features/bmi_form/domain/repositories/base_save_bmi_repo.dart';
import 'package:equatable/equatable.dart';

class SaveBmiUseCase {
  BaseSaveBmiRepo baseSaveBmiRepo;

  SaveBmiUseCase({required this.baseSaveBmiRepo});

  Future<void> call({required BmiSavingParameters bmiSavingParameters}) async {
    try {
      await baseSaveBmiRepo.saveBmiData(
          bmiSavingParameters: bmiSavingParameters);
    } catch (e) {
      rethrow;
    }
  }
}

class BmiSavingParameters extends Equatable {
  final BmiEntry bmiEntry;
  final String userId;

  const BmiSavingParameters({required this.bmiEntry, required this.userId});

  @override
  List<Object?> get props => [bmiEntry, userId];
}
