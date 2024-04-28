import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/app_keys_values.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';

class BmiEntryWithIdModel extends BmiEntryWithId {
  const BmiEntryWithIdModel(
      {required super.id,
      required super.height,
      required super.weight,
      required super.bmiStatus,
      required super.date,
      required super.age,
      required super.bmi});

  factory BmiEntryWithIdModel.fromJson(
      {required Map<String, dynamic> json, required String id}) {
    logger.e("$json $id");
    return BmiEntryWithIdModel(
      id: id,
      height: json[AppKeyValues.height],
      weight: json[AppKeyValues.weight],
      bmiStatus: json[AppKeyValues.bmiStatus],
      date: json[AppKeyValues.date],
      age: json[AppKeyValues.age],
      bmi:json[AppKeyValues.bmi],
    );
  }
}
