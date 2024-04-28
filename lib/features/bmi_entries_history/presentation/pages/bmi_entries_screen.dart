import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/core/util/widgets/loading_widget.dart';
import 'package:bmi_calculator/core/util/widgets/separator_widget.dart';
import 'package:bmi_calculator/features/bmi_entries_history/presentation/manager/bmi_history_bloc.dart';
import 'package:bmi_calculator/features/bmi_entries_history/presentation/widgets/bmi_entry_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_pagination/number_pagination.dart';

class BmiEntriesScreen extends StatelessWidget {
  const BmiEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<BmiHistoryBloc>()..add(const GetBmiHistoryEvent()),
      child: const BmiHistoryView(),
    );
  }
}

class BmiHistoryView extends StatelessWidget {
  const BmiHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiHistoryBloc, BmiHistoryState>(
      listener: (context, state) {
        if (state.deleteBmiEntryState == RequestState.success) {
          UtilFunction.showToast(
              message: StringConstance.bmiDeletedSuccessfully,
              state: ToastState.success);
        } else if (state.deleteBmiEntryState == RequestState.error) {
          UtilFunction.showToast(
              message: state.deleteBmiEntryMessage, state: ToastState.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<BmiHistoryBloc>();
        return ConditionalBuilder(
          condition: state.displayedItems.isNotEmpty,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.displayedItems.length,
                      itemBuilder: (context, index) {
                        return BmiEntryItem(
                          bmiEntry: state.displayedItems[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SeparatorWidget();
                      },
                    ),
                  ),
                  if (state.bmiHistoryList.length > 10)
                    NumberPagination(
                      onPageChanged: (int pageNumber) {
                        cubit.add(ChangePageEvent(pageNumber: pageNumber));
                      },
                      pageTotal: state.totalPage,
                    ),
                ],
              ),
            );
          },
          fallback: (context) {
            return ConditionalBuilder(
              condition: state.bmiHistoryList.isEmpty &&
                  state.getBmiHistoryState == RequestState.success,
              builder: (context) {
                return const Center(
                  child: Text(StringConstance.thereIsNoHistory),
                );
              },
              fallback: (context) {
                return const LoadingIndicator();
              },
            );
          },
        );
      },
    );
  }
}
