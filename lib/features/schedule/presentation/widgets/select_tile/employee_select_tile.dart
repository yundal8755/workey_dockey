import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/tile/schedules_add_employee_tile.dart';

class EmployeeSelectTile extends StatelessWidget {

  const EmployeeSelectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoute.employeeSelect.path);
      },
      child: SchedulesAddEmployeeTile(
        title: '직원',
        content: '직원을 선택해주세요',
        avatarBackgroundColor: AppColors.grey25,
        avatarTextColor: AppColors.grey600,
      ),
    );
  }
}
