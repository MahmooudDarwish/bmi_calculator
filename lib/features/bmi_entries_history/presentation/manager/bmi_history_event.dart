part of 'bmi_history_bloc.dart';

@immutable
sealed class BmiHistoryEvent extends Equatable {
  const BmiHistoryEvent();
}

class GetBmiHistoryEvent extends BmiHistoryEvent {
  const GetBmiHistoryEvent();
  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends BmiHistoryEvent {
  final int pageNumber;
  const ChangePageEvent({required this.pageNumber});
  @override
  List<Object?> get props => [];
}

class DeleteBmiEntryEvent extends BmiHistoryEvent {
  final String bmiEntryId;
  const DeleteBmiEntryEvent({required this.bmiEntryId});
  @override
  List<Object?> get props => [bmiEntryId];
}
