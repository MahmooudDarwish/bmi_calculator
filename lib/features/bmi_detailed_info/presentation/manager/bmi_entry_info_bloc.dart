import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/use_cases/edit_bmi_entry_use_case.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bmi_entry_info_event.dart';
part 'bmi_entry_info_state.dart';

class BmiEntryInfoBloc extends Bloc<BmiEntryInfoEvent, BmiEntryInfoState> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  get heightController => _heightController;
  get weightController => _weightController;
  get ageController => _ageController;
  get formKey => _formKey;

  final EditBmiEntryUseCase editBmiUseCase;
  BmiEntryInfoBloc({required this.editBmiUseCase})
      : super(const BmiEntryInfoState()) {
    on<SetBmiEntryEvent>(_setBmiEntry);
    on<CalculateBmiButtonPressedEvent>(_calculateBmi);
    on<EditBmiButtonPressedEvent>(_editBmi);
  }

  FutureOr<void> _setBmiEntry(
      SetBmiEntryEvent event, Emitter<BmiEntryInfoState> emit) {
    logger.i("Set bmi entry with id : ${event.bmiEntryWithId}");
    weightController.text = event.bmiEntryWithId.weight.toString();
    heightController.text = event.bmiEntryWithId.height.toString();
    ageController.text = event.bmiEntryWithId.age.toString();
    emit(state.copyWith(bmiEntryWithId: event.bmiEntryWithId));
  }

  FutureOr<void> _calculateBmi(
      CalculateBmiButtonPressedEvent event, Emitter<BmiEntryInfoState> emit) {
    double bmi = double.parse(_weightController.text) /
        double.parse(_heightController.text);
    logger.i("Bmi : $bmi");

    emit(
      state.copyWith(
        isCalculated: true,
        bmiEntryWithId: BmiEntryWithId(
          bmi: bmi,
          id: state.bmiEntryWithId!.id,
          height: double.parse(_weightController.text),
          weight: double.parse(_heightController.text),
          bmiStatus: "normal",
          date: DateTime.now().toString(),
          age: int.parse(
            _ageController.text,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _editBmi(
      EditBmiButtonPressedEvent event, Emitter<BmiEntryInfoState> emit) {
    emit(state.copyWith(editBmiInfoRequestState: RequestState.loading));
    try {
      editBmiUseCase.call(
          bmiEditingParameters: BmiEditingParameters(
        userId: sl<User>().uid,
        bmiEntryWithId: state.bmiEntryWithId!,
      ));
      emit(state.copyWith(
          editBmiInfoRequestState: RequestState.success, isCalculated: false));
      logger.i("Bmi Entry Edited to: ${state.bmiEntryWithId}");
    } catch (e) {
      emit(state.copyWith(editBmiInfoRequestState: RequestState.error));
    }
    emit(state.copyWith(editBmiInfoRequestState: RequestState.idle));
  }

  @override
  Future<void> close() async {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    logger.d("Bmi Entry Bloc Closed");
    super.close();
  }
}
