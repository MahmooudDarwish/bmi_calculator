import 'package:bmi_calculator/core/services/navigation/route_path.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/core/util/widgets/default_button.dart';
import 'package:bmi_calculator/features/sign_in/presentation/manager/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.getUserRequestState == RequestState.success) {
          logger.i("Anonymous user logged in ${sl<User>()}");
          context.go(RoutePath.bmiFormPage);
        } else if (state.getUserRequestState == RequestState.error) {
          logger.e(state.getUserMessage);
          UtilFunction.showToast(
              message: state.getUserMessage, state: ToastState.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstance.welcome,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              DefaultButton(
                contentPadding: 20.0,
                onPressed: () {
                  context
                      .read<SignInBloc>()
                      .add(const SignInButtonPressedEvent());
                },
                backgroundColor: Colors.green,
                label: StringConstance.signIn,
                suffixIcon: Icons.login_outlined,
                iconColor: Colors.black,
                labelColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
