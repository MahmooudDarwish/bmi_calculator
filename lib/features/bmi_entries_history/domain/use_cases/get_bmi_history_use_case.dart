import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_get_bmi_history_repo.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:equatable/equatable.dart';

class GetBmiHistoryUseCase {
  BaseGetBmiHistoryRepo baseGetBmiHistoryRepo;
  GetBmiHistoryUseCase({required this.baseGetBmiHistoryRepo});

  Future<Stream<List<BmiEntryWithId>>> call(
      {required BmiGettingHistoryParameters
          bmiGettingHistoryParameters}) async {
    try {
      return await baseGetBmiHistoryRepo.getBmiHistoryData(
          bmiGettingHistoryParameters: bmiGettingHistoryParameters);
    } catch (e) {
      rethrow;
    }
  }
}

class BmiGettingHistoryParameters extends Equatable {
  final String userId;
  const BmiGettingHistoryParameters({required this.userId});

  @override
  List<Object?> get props => [userId];
}

