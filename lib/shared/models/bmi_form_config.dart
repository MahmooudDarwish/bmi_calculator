import 'package:flutter/material.dart';

class BmiFormConfig {
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController ageController;
  final void Function()? onCalculateButtonPressed;
  final void Function()? onSaveButtonPressed;
  final String buttonFormLabel;
  final double bmi;
  final GlobalKey<FormState> formKey;

  BmiFormConfig(
      {required this.weightController,
      required this.heightController,
      required this.ageController,
      required this.onCalculateButtonPressed,
      required this.onSaveButtonPressed,
      required this.buttonFormLabel,
      required this.bmi,
      required this.formKey});
}
