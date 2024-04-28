part of 'bmi_entry_info_bloc.dart';

@immutable
class BmiEntryInfoState extends Equatable {
  final RequestState editBmiInfoRequestState;
  final String editBmiInfoMessage;
  final bool isCalculated;
  final BmiEntryWithId? bmiEntryWithId;

  const BmiEntryInfoState({
    this.editBmiInfoRequestState = RequestState.idle,
    this.editBmiInfoMessage = '',
    this.isCalculated = false,
    this.bmiEntryWithId,
  });

  BmiEntryInfoState copyWith({
    RequestState? editBmiInfoRequestState,
    String? editBmiInfoMessage,
    bool? isCalculated,
    BmiEntryWithId? bmiEntryWithId,
  }) {
    return BmiEntryInfoState(
      editBmiInfoRequestState:
          editBmiInfoRequestState ?? this.editBmiInfoRequestState,
      editBmiInfoMessage: editBmiInfoMessage ?? this.editBmiInfoMessage,
      isCalculated: isCalculated ?? this.isCalculated,
      bmiEntryWithId: bmiEntryWithId ?? this.bmiEntryWithId,
    );
  }

  @override
  List<Object?> get props => [
        editBmiInfoMessage,
        editBmiInfoRequestState,
        isCalculated,
        bmiEntryWithId,
      ];
}
