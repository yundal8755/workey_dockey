import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/features/schedule/presentation/state/time_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/tile/schedules_add_list_tile.dart';

class TimeSelectTile extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;

  const TimeSelectTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeSelectionProvider);

    return GestureDetector(
      onTap: onTap,
      child: SchedulesAddListTile(
        title: title,
        content: title == '시작 시간'
            ? time['startTime']?.format(context) ?? '시간 선택'
            : time['endTime']?.format(context) ?? '시간 선택',
      ),
    );
  }
}

