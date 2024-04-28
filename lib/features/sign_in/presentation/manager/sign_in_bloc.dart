import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  SignInBloc({required this.signInUseCase}) : super(const SignInState()) {
    on<SignInButtonPressedEvent>(_signInAnonymously);
  }

  FutureOr<void> _signInAnonymously(
      SignInButtonPressedEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(getUserRequestState: RequestState.loading));
    try {
      User? user = await signInUseCase.call();
      if (user != null) {
        sl.registerLazySingleton<User>(() => user);
      }
      emit(state.copyWith(
        getUserRequestState: RequestState.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        getUserRequestState: RequestState.error,
        getUserMessage: e.toString(),
      ));
    }
    emit(state.copyWith(getUserRequestState: RequestState.idle));
  }
}
