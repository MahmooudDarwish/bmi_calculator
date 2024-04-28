import 'package:bmi_calculator/core/util/app_keys_values.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry.dart';

class BmiEntryModel extends BmiEntry {
  const BmiEntryModel({
    required super.height,
    required super.weight,
    required super.bmiStatus,
    required super.date,
    required super.age,
    required super.bmi,
  });

  factory BmiEntryModel.fromJson({required Map<String, dynamic> json}) {
    return BmiEntryModel(
      height: json[AppKeyValues.height],
      weight: json[AppKeyValues.weight],
      bmiStatus: json[AppKeyValues.bmiStatus],
      date: json[AppKeyValues.date],
      age: json[AppKeyValues.age],
      bmi: json[AppKeyValues.bmi],
    );
  }
}
