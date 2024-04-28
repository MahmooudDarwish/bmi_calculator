import 'package:equatable/equatable.dart';

class BmiEntry extends Equatable {
  final double height;
  final double weight;
  final String bmiStatus;
  final double bmi;
  final int age;
  final String date;

  const BmiEntry({
    required this.bmi,
    required this.age,
    required this.height,
    required this.weight,
    required this.bmiStatus,
    required this.date,
  });

  @override
  List<Object?> get props => [
        height,
        weight,
        age,
        bmiStatus,
        date,
        bmi,
      ];
}
