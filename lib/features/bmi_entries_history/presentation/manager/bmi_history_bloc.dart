import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/delete_bmi_entry_use_case.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/get_bmi_history_use_case.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'bmi_history_event.dart';
part 'bmi_history_state.dart';

class BmiHistoryBloc extends Bloc<BmiHistoryEvent, BmiHistoryState> {
  final GetBmiHistoryUseCase getBmiHistoryUseCase;
  final DeleteBmiEntryUseCase deleteBmiEntryUseCase;

  BmiHistoryBloc(
      {required this.getBmiHistoryUseCase, required this.deleteBmiEntryUseCase})
      : super(const BmiHistoryState()) {
    on<GetBmiHistoryEvent>(_getBmiHistory);
    on<ChangePageEvent>(_changePage);
    on<DeleteBmiEntryEvent>(_deleteBmiEntry);
  }

  FutureOr<void> _getBmiHistory(
      GetBmiHistoryEvent event, Emitter<BmiHistoryState> emit) async {
    emit(state.copyWith(getBmiHistoryState: RequestState.loading));

    try {
      final Stream<List<BmiEntryWithId>> bmiHistoryStream =
          await getBmiHistoryUseCase.call(
              bmiGettingHistoryParameters: BmiGettingHistoryParameters(
        userId: sl<User>().uid,
      ));

      await for (final List<BmiEntryWithId> bmiHistory in bmiHistoryStream) {
        emit(state.copyWith(
          getBmiHistoryState: RequestState.success,
          bmiHistoryList: bmiHistory,
        ));
        emit(state.copyWith(
          totalPage: _getTotalPageNum(),
          displayedItems: _getDisplayedList(state.currentPage),
        ));
        logger.i("Get BMI History Success");
      }
    } catch (e) {
      emit(state.copyWith(getBmiHistoryState: RequestState.error));
      logger.e("Get BMI History Error ${e.toString()}");
    }
    emit(state.copyWith(getBmiHistoryState: RequestState.idle));
  }

  int _getTotalPageNum() {
    int totalPage = (state.bmiHistoryList.length / state.itemsPerPage).ceil();
    logger.i("Total Page: $totalPage");
    return totalPage;
  }

  List<BmiEntryWithId> _getDisplayedList(int page) {
    print("hello");
    final startIndex = (page) * state.itemsPerPage;
    final endIndex = startIndex + state.itemsPerPage;

    final effectiveEndIndex = endIndex > state.bmiHistoryList.length
        ? state.bmiHistoryList.length
        : endIndex;

    List<BmiEntryWithId> tempItems =
        state.bmiHistoryList.sublist(startIndex, effectiveEndIndex);
    logger.i("Display List: $tempItems");
    return tempItems;
  }

  FutureOr<void> _changePage(
      ChangePageEvent event, Emitter<BmiHistoryState> emit) {
    logger.i("Change Page: ${event.pageNumber}");
    emit(state.copyWith(
        displayedItems: _getDisplayedList(event.pageNumber - 1),
        currentPage: event.pageNumber - 1));
  }

  FutureOr<void> _deleteBmiEntry(
      DeleteBmiEntryEvent event, Emitter<BmiHistoryState> emit) async {
    emit(state.copyWith(getBmiHistoryState: RequestState.loading));
    try {
      await deleteBmiEntryUseCase.call(
          bmiEntryDeletingParameters: BmiEntryDeletingParameters(
        userId: sl<User>().uid,
        bmiEntryId: event.bmiEntryId,
      ));
      emit(state.copyWith(
        getBmiHistoryState: RequestState.success,
      ));
      logger.i("Delete BMI Entry Success");
    } catch (e) {
      emit(state.copyWith(getBmiHistoryState: RequestState.error));
      logger.e("Delete BMI Entry Error");
    }
    emit(state.copyWith(getBmiHistoryState: RequestState.idle));
  }
}
