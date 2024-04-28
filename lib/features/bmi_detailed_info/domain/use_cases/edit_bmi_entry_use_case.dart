import 'package:bmi_calculator/features/bmi_detailed_info/domain/repositories/base_edit_bmi_entry_repo.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:equatable/equatable.dart';

class EditBmiEntryUseCase {
  BaseEditBmiEntryRepo baseEditBmiEntryRepo;

  EditBmiEntryUseCase({required this.baseEditBmiEntryRepo});

  Future<void> call(
      {required BmiEditingParameters bmiEditingParameters}) async {
    try {
      await baseEditBmiEntryRepo.editBmiEntry(
          bmiEditingParameters: bmiEditingParameters);
    } catch (e) {
      rethrow;
    }
  }
}

class BmiEditingParameters extends Equatable {
  final String userId;
  final BmiEntryWithId bmiEntryWithId;

  const BmiEditingParameters(
      {required this.userId, required this.bmiEntryWithId});

  @override
  List<Object?> get props => [
        userId,
        bmiEntryWithId,
      ];
}
