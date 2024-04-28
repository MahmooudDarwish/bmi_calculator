import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String? errorMessage;
  const ErrorMessage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage ?? StringConstance.defaultErrorMessage),
    );
  }
}
