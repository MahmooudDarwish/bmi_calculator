part of 'bmi_entry_info_bloc.dart';

@immutable
sealed class BmiEntryInfoEvent {
  const BmiEntryInfoEvent();
}

class CalculateBmiButtonPressedEvent extends BmiEntryInfoEvent {
  const CalculateBmiButtonPressedEvent();
}

class EditBmiButtonPressedEvent extends BmiEntryInfoEvent {
  const EditBmiButtonPressedEvent();
}

class SetBmiEntryEvent extends BmiEntryInfoEvent {
  final BmiEntryWithId bmiEntryWithId;
  const SetBmiEntryEvent({required this.bmiEntryWithId});
}
