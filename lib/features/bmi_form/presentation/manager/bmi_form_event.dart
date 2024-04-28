part of 'bmi_form_bloc.dart';

@immutable
sealed class BmiFormEvent {
  const BmiFormEvent();
}

class CalculateBmiButtonPressedEvent extends BmiFormEvent {
  const CalculateBmiButtonPressedEvent();
}

class SaveBmiButtonPressedEvent extends BmiFormEvent {
  const SaveBmiButtonPressedEvent();
}
