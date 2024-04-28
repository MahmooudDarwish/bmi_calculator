import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/features/home/domain/use_cases/sign_out_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SignOutUseCase signOutUseCase;
  HomeBloc({required this.signOutUseCase}) : super(const HomeState()) {
    on<BottomNavBarTappedEvent>(_changeBottomNavBarIndex);
    on<SignOutEvent>(_signOut);
  }

  FutureOr<void> _changeBottomNavBarIndex(
      BottomNavBarTappedEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
    logger.i("Index: ${event.index}");
    event.navigationShell.goBranch(event.index,
        initialLocation: event.index == event.navigationShell.currentIndex + 1);
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<HomeState> emit) async {
    try {
      await signOutUseCase.call();
      emit(state.copyWith(signOutRequestState: RequestState.success));
      logger.d("Sign Out Success");
    } catch (e) {
      emit(state.copyWith(
          signOutRequestState: RequestState.error,
          signOutMessage: e.toString()));
      logger.e("Sign Out Error: ${e.toString()}");
    }
  }
}
