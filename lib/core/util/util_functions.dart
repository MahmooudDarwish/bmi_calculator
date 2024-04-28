import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class UtilFunction {
  static String? validateWeightField({required String? weight}) {
    if (weight!.isEmpty) {
      return StringConstance.pleaseEnterValidWeight;
    }
    if (weight.length < 2 || double.parse(weight) > 635) {
      //the fattest man in the world has 635kg
      return StringConstance.pleaseEnterValidWeight;
    }
    return null;
  }

  static String? validateHeightField({required String? height}) {
    if (height!.isEmpty) {
      return StringConstance.pleaseEnterYourHeight;
    }
    if (height.length > 4 || double.parse(height) > 2.46) {
      //the tallest man in the world has 2.46m
      return StringConstance.pleaseEnterValidHeight;
    }
    return null;
  }

  static String? validateAgeField({required String? age}) {
    if (age!.isEmpty) {
      return StringConstance.pleaseEnterYourAge;
    }
    if (int.parse(age) > 117) {
      //the oldest man in the world has 116 year and 361 day
      return StringConstance.pleaseEnterValidAge;
    }
    return null;
  }

  static Color _chooseToastColor({required ToastState state}) {
    Color color;
    switch (state) {
      case ToastState.error:
        color = Colors.red;
        break;
      case ToastState.success:
        color = Colors.green;
        break;
      case ToastState.warning:
        color = Colors.amber;
        break;
    }
    return color;
  }

  static void showToast(
          {required String? message, required ToastState state}) =>
      Fluttertoast.showToast(
          msg: message ?? StringConstance.defaultErrorMessage,
          /* if we want to make it ""msg: state.loginUser?.message"" without ""?? "Something went wrong"""
                  we need to declare message as dynamic not string? */
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: _chooseToastColor(state: state),
          textColor: Colors.white,
          fontSize: 16.0);
}
