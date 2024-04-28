part of 'bmi_form_bloc.dart';

@immutable
class BmiFormState extends Equatable {
  final double bmi;
  final bool isCalculated;
  final RequestState saveBmiRequestState;
  final String saveBmiMessage;

  const BmiFormState({
    this.bmi = 0,
    this.isCalculated = false,
    this.saveBmiRequestState = RequestState.idle,
    this.saveBmiMessage = '',
  });

  BmiFormState copyWith({
    double? bmi,
    bool? isCalculated,
    RequestState? saveBmiRequestState,
    String? saveBmiMessage,
  }) =>
      BmiFormState(
        bmi: bmi ?? this.bmi,
        isCalculated: isCalculated ?? this.isCalculated,
        saveBmiRequestState: saveBmiRequestState ?? this.saveBmiRequestState,
        saveBmiMessage: saveBmiMessage ?? this.saveBmiMessage,
      );
  @override
  List<Object?> get props => [
        bmi,
        isCalculated,
        saveBmiRequestState,
        saveBmiMessage,
      ];
}
