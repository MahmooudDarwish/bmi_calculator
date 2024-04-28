import 'package:bmi_calculator/shared/entities/bmi_entry.dart';

class BmiEntryWithId extends BmiEntry {
  final String id;
  const BmiEntryWithId({
    required this.id,
    required super.height,
    required super.weight,
    required super.bmiStatus,
    required super.date,
    required super.age,
    required super.bmi,
  });

  @override
  List<Object?> get props => [id, ...super.props];
}
