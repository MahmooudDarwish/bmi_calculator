import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/features/bmi_form/domain/use_cases/save_bmi_use_case.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bmi_form_event.dart';
part 'bmi_form_state.dart';

class BmiFormBloc extends Bloc<BmiFormEvent, BmiFormState> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  get heightController => _heightController;
  get weightController => _weightController;
  get ageController => _ageController;
  get formKey => _formKey;

  final SaveBmiUseCase saveBmiUseCase;

  BmiFormBloc({required this.saveBmiUseCase}) : super(const BmiFormState()) {
    on<CalculateBmiButtonPressedEvent>(_calculateBmi);
    on<SaveBmiButtonPressedEvent>(_saveBmi);
  }

  FutureOr<void> _calculateBmi(
      CalculateBmiButtonPressedEvent event, Emitter<BmiFormState> emit) {
    double bmi = double.parse(_weightController.text) /
        double.parse(_heightController.text);
    logger.i("Bmi: $bmi");
    emit(state.copyWith(bmi: bmi, isCalculated: true));
  }

  FutureOr<void> _saveBmi(
      SaveBmiButtonPressedEvent event, Emitter<BmiFormState> emit) async {
    emit(state.copyWith(saveBmiRequestState: RequestState.loading));
    try {
      await saveBmiUseCase.call(
          bmiSavingParameters: BmiSavingParameters(
              bmiEntry: BmiEntry(
                bmi: state.bmi,
                height: double.parse(_heightController.text),
                age: int.parse(_ageController.text),
                bmiStatus: "normal",
                date: DateTime.now().toString(),
                weight: double.parse(_weightController.text),
              ),
              userId: sl<User>().uid));
      emit(state.copyWith(
          isCalculated: false, saveBmiRequestState: RequestState.success));
      logger.i("Save BMI Success");
    } catch (e) {
      logger.e("Save BMI Error: ${e.toString()}");
      emit(state.copyWith(
        saveBmiRequestState: RequestState.error,
        saveBmiMessage: e.toString(),
      ));
    }
    emit(state.copyWith(saveBmiRequestState: RequestState.idle));
  }

  @override
  Future<void> close() async {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    logger.d("Bmi form bloc closed");
    super.close();
  }
}
