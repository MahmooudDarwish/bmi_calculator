import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/features/bmi_form/presentation/manager/bmi_form_bloc.dart';
import 'package:bmi_calculator/shared/models/bmi_form_config.dart';
import 'package:bmi_calculator/shared/pages/bmi_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiFormScreen extends StatelessWidget {
  const BmiFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BmiFormBloc>(),
      child: const SaveBmiFormView(),
    );
  }
}

class SaveBmiFormView extends StatelessWidget {
  const SaveBmiFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BmiFormBloc>();
    return BlocConsumer<BmiFormBloc, BmiFormState>(listener: (context, state) {
      if (state.saveBmiRequestState == RequestState.success) {
        UtilFunction.showToast(
            message: StringConstance.bmiSavedSuccessfully,
            state: ToastState.success);
      } else if (state.saveBmiRequestState == RequestState.error) {
        UtilFunction.showToast(
            message: state.saveBmiMessage, state: ToastState.error);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: BmiFormView(
          config: BmiFormConfig(
            formKey: cubit.formKey,
            weightController: cubit.weightController,
            ageController: cubit.ageController,
            heightController: cubit.heightController,
            bmi: state.bmi,
            buttonFormLabel: StringConstance.saveBmiButtonLabel,
            onCalculateButtonPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.add(const CalculateBmiButtonPressedEvent());
              }
            },
            onSaveButtonPressed: state.isCalculated
                ? () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.add(const SaveBmiButtonPressedEvent());
                    }
                  }
                : null,
          ),
        ),
      );
    });
  }
}
