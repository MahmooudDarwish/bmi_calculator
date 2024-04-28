import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/core/util/widgets/default_button.dart';
import 'package:bmi_calculator/core/util/widgets/default_text_form_field.dart';
import 'package:bmi_calculator/shared/widgets/bmi_indicator.dart';
import 'package:bmi_calculator/shared/models/bmi_form_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BmiFormView extends StatelessWidget {
  final BmiFormConfig config;

  const BmiFormView({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: config.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultTextFormField(
              keyboardType: TextInputType.number,
              controller: config.weightController,
              validate: (value) {
                return UtilFunction.validateWeightField(weight: value);
              },
              digitLimit: 6,
              label: StringConstance.weightInKilograms,
              prefix: Icons.scale_outlined,
            ),
            const Gap(20),
            DefaultTextFormField(
              keyboardType: TextInputType.number,
              controller: config.heightController,
              digitLimit: 4,
              validate: (value) {
                return UtilFunction.validateHeightField(height: value);
              },
              label: StringConstance.heightInMeters,
              prefix: Icons.height_outlined,
            ),
            const Gap(20),
            DefaultTextFormField(
              keyboardType: TextInputType.number,
              controller: config.ageController,
              digitLimit: 3,
              validate: (value) {
                return UtilFunction.validateAgeField(age: value);
              },
              label: StringConstance.age,
              prefix: Icons.calendar_month_sharp,
            ),
            const Gap(20),
            DefaultButton(
              onPressed: config.onCalculateButtonPressed,
              label: StringConstance.calculateBmi,
              suffixIcon: Icons.calculate_sharp,
              iconColor: Colors.black,
              labelColor: Colors.black,
            ),
            const Gap(20),
            BmiIndicator(bmi: config.bmi),
            DefaultButton(
              onPressed: config.onSaveButtonPressed,
              backgroundColor: Colors.green,
              label: config.buttonFormLabel,
              suffixIcon: Icons.save_outlined,
              iconColor: Colors.black,
              labelColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
