// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_const.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/layout/schedules_default_layout.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/features/schedule/presentation/state/date_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/custom_floating_button.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/date_picker_wrapper.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/scrollable_schedule_board_list.dart';

class SchedulesScreen extends ConsumerWidget {
  const SchedulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateSelectionProvider);

    return SchedulesDefaultLayout(
      title: '일정 관리',
      appbarBottomWidget: PreferredSize(
        preferredSize: Size.fromHeight(
          AppConst.appBarBottomHeight(context),
        ),
        child: DatePickerWrapper(selectedDate: selectedDate),
      ),
      child: Stack(
        children: [
          ScrollableScheduleBoardList(selectedDate: selectedDate),
          CustomFloatingButton(
            onPressed: () {
              context.push(AppRoute.scheduleAdd.path,
                  extra: DateTime.now().toIso8601String());
            },
            backgroundColor: AppColors.brand600,
            icon: ImagePaths.plusIcon,
          ),
        ],
      ),
    );
  }
}
