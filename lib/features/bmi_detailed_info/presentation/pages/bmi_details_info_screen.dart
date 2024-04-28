import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/presentation/manager/bmi_entry_info_bloc.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:bmi_calculator/shared/models/bmi_form_config.dart';
import 'package:bmi_calculator/shared/pages/bmi_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiDetailsInfoScreen extends StatelessWidget {
  final BmiEntryWithId bmiEntryWithId;
  const BmiDetailsInfoScreen({super.key, required this.bmiEntryWithId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BmiEntryInfoBloc>()
        ..add(SetBmiEntryEvent(bmiEntryWithId: bmiEntryWithId)),
      child: const EditBmiFormView(),
    );
  }
}

class EditBmiFormView extends StatelessWidget {
  const EditBmiFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BmiEntryInfoBloc>();
    return BlocConsumer<BmiEntryInfoBloc, BmiEntryInfoState>(
        listener: (context, state) {
      if (state.editBmiInfoRequestState == RequestState.success) {
        UtilFunction.showToast(
            message: StringConstance.bmiEditedSuccessfully,
            state: ToastState.success);
      } else if (state.editBmiInfoRequestState == RequestState.error) {
        UtilFunction.showToast(
            message: state.editBmiInfoMessage, state: ToastState.error);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: BmiFormView(
            config: BmiFormConfig(
              formKey: cubit.formKey,
              weightController: cubit.weightController,
              ageController: cubit.ageController,
              heightController: cubit.heightController,
              bmi: state.bmiEntryWithId?.bmi ?? 0.0,
              buttonFormLabel: StringConstance.editButtonLabel,
              onCalculateButtonPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.add(const CalculateBmiButtonPressedEvent());
                }
              },
              onSaveButtonPressed: state.isCalculated
                  ? () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.add(const EditBmiButtonPressedEvent());
                      }
                    }
                  : null,
            ),
          ),
        ),
      );
    });
  }
}
