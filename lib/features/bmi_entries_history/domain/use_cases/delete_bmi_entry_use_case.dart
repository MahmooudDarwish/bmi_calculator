import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_delete_bmi_entry_repo.dart';
import 'package:equatable/equatable.dart';

class DeleteBmiEntryUseCase {
  BaseDeleteBmiEntryRepo baseDeleteBmiEntryRepo;

  DeleteBmiEntryUseCase({required this.baseDeleteBmiEntryRepo});

  Future<void> call(
      {required BmiEntryDeletingParameters bmiEntryDeletingParameters}) async {
    return await baseDeleteBmiEntryRepo.deleteBmiEntry(
        bmiEntryDeletingParameters: bmiEntryDeletingParameters);
  }
}

class BmiEntryDeletingParameters extends Equatable {
  final String bmiEntryId;
  final String userId;

  const BmiEntryDeletingParameters({
    required this.bmiEntryId,
    required this.userId,
  });

  @override
  List<Object?> get props => [];
}
