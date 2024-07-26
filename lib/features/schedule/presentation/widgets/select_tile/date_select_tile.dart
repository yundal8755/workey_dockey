import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/features/schedule/presentation/state/date_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/date_picker.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/tile/schedules_add_list_tile.dart';

class DateSelectTile extends ConsumerWidget {
  const DateSelectTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateSelectionProvider);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: AppColors.grey25,
              contentPadding: EdgeInsets.zero,
              content: DatePicker(),
            );
          },
        );
      },
      child: SchedulesAddListTile(
          title: '날짜', content: DateFormat('yyyy년 M월 d일').format(selectedDate)),
    );
  }
}
