// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/layout/schedules_default_layout.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
import 'package:workeydockey/features/schedule/presentation/state/time_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/select_tile/date_select_tile.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/select_tile/employee_select_tile.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/tile/memo_textfield_tile.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/select_tile/role_select_tile.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/select_tile/time_select_tile.dart';

class SchedulesAddScreen extends ConsumerStatefulWidget {
  final String displayDate;

  const SchedulesAddScreen({super.key, required this.displayDate});

  @override
  SchedulesAddScreenState createState() => SchedulesAddScreenState();
}

class SchedulesAddScreenState extends ConsumerState<SchedulesAddScreen> {
  late SchedulesController controller;

  @override
  void initState() {
    super.initState();
    controller = SchedulesController();
  }

  @override
  Widget build(BuildContext context) {
    final workTimeNotifier = ref.read(timeSelectionProvider.notifier);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SchedulesDefaultLayout(
        title: '근무 일정 추가',
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DateSelectTile(),
              TimeSelectTile(
                title: '시작 시간',
                onTap: () => workTimeNotifier.selectTime(context, true),
              ),
              TimeSelectTile(
                title: '종료 시간',
                onTap: () => workTimeNotifier.selectTime(context, false),
              ),
              const EmployeeSelectTile(),
              RoleSelectTile(controller: controller),
              MemoTextfieldTile(controller: controller),
              SoftButton(
                disabledBackgroundColor: AppColors.brand600.withOpacity(0.5),
                backgroundColor: AppColors.brand600,
                onPressed: () {},
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      '저장하기',
                      style: AppTextTheme.md.semiBold
                          .copyWith(color: AppColors.grey25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
