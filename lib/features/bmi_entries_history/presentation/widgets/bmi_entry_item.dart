import 'package:bmi_calculator/core/services/navigation/route_path.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/widgets/default_button.dart';
import 'package:bmi_calculator/features/bmi_entries_history/presentation/manager/bmi_history_bloc.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BmiEntryItem extends StatelessWidget {
  final BmiEntryWithId bmiEntry;
  const BmiEntryItem({super.key, required this.bmiEntry});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context
                    .read<BmiHistoryBloc>()
                    .add(DeleteBmiEntryEvent(bmiEntryId: bmiEntry.id));
              },
              icon: const Icon(Icons.delete_outline)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${StringConstance.weight} ${bmiEntry.weight}"),
              Text("${StringConstance.height} ${bmiEntry.height}"),
            ],
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${StringConstance.ageEntryItem} ${bmiEntry.age}"),
              Text("${StringConstance.bmiStatus} ${bmiEntry.bmiStatus}"),
            ],
          ),
          const Gap(10),
          DefaultButton(
            onPressed: () {
              context.push(RoutePath.bmiDetailsPage, extra: bmiEntry);
            },
            contentPadding: 8.0,
            label: StringConstance.detailsButtonLabel,
            suffixIcon: Icons.arrow_forward_outlined,
            iconColor: Colors.black,
            labelColor: Colors.black,
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
