import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class SchedulesDetailInfo extends StatelessWidget {
  final Map<String, dynamic> schedule;

  const SchedulesDetailInfo({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final String employeeName = schedule['employee'];

    return GestureDetector(
      onTap: () => context.push(AppRoute.scheduleDetail.path, extra: schedule),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey200),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: schedule['avatarBackgroundColor'],
              child: Text(
                employeeName.length >= 3
                    ? employeeName.substring(employeeName.length - 2)
                    : employeeName,
                style: AppTextTheme.md.medium.copyWith(
                  color: schedule['avatarTextColor'],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule['employee']!,
                  style: AppTextTheme.md.semiBold
                      .copyWith(color: AppColors.grey700),
                ),
                Text(
                  '${schedule['startTime']} - ${schedule['endTime']}',
                  style: AppTextTheme.sm.regular
                      .copyWith(color: AppColors.grey600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
