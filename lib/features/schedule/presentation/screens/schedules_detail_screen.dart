// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/layout/schedules_default_layout.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

class SchedulesDetailScreen extends StatelessWidget {
  final Map<String, dynamic> schedule;

  const SchedulesDetailScreen({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final SchedulesController controller = SchedulesController();

    // 날짜 포맷 변경
    DateTime date = DateFormat('yyyy-MM-dd').parse(schedule['date']!);
    String formattedDate = DateFormat('yyyy년 M월 d일 EEEE', 'ko_KR').format(date);

    // 근무 시간 계산
    DateTime startTime = controller.parseTime(schedule['startTime']!);
    DateTime endTime = controller.parseTime(schedule['endTime']!);
    Duration workDuration = endTime.difference(startTime);

    final String employeeName = schedule['employee'];

    print('근무 상세 정보 : $schedule');

    return SchedulesDefaultLayout(
      title: '근무 상세 정보',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! 나열된 정보
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ImagePaths.usersIcon,
                    width: 28,
                    height: 28,
                    color: AppColors.brand600,
                  ),
                  Gap.size12,
                  CircleAvatar(
                    radius: 16,
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
                  Gap.size10,
                  Text(
                    schedule['employee']!,
                    style: AppTextTheme.md.regular
                        .copyWith(color: AppColors.grey900),
                  )
                ],
              ),
              Gap.size28,
              Row(
                children: [
                  Image.asset(
                    ImagePaths.calendarCheckIcon,
                    width: 28,
                    height: 28,
                    color: AppColors.brand600,
                  ),
                  Gap.size12,
                  Text(
                    formattedDate,
                    style: AppTextTheme.sm.regular
                        .copyWith(color: AppColors.grey900),
                  )
                ],
              ),
              Gap.size28,
              Row(
                children: [
                  Image.asset(
                    ImagePaths.clockIcon,
                    width: 28,
                    height: 28,
                    color: AppColors.brand600,
                  ),
                  Gap.size12,
                  Text(
                    '${schedule['startTime']} - ${schedule['endTime']} (${workDuration.inHours}시간 ${workDuration.inMinutes % 60}분)',
                    style: AppTextTheme.sm.regular
                        .copyWith(color: AppColors.grey900),
                  )
                ],
              ),
              Gap.size28,
              Row(
                children: [
                  Image.asset(
                    ImagePaths.bagSimpleIcon,
                    width: 28,
                    height: 28,
                    color: AppColors.brand600,
                  ),
                  Gap.size12,
                  Text(
                    '${schedule['role']}',
                    style: AppTextTheme.sm.regular
                        .copyWith(color: AppColors.grey900),
                  )
                ],
              ),
            ],
          ),
      
          //! 수정하기 버튼
          SoftButton(
            width: MediaQuery.of(context).size.width,
            backgroundColor: AppColors.brand600,
            onPressed: () =>
                context.push(AppRoute.scheduleUpdate.path, extra: schedule),
            child: Text(
              '수정하기',
              style: AppTextTheme.md.semiBold
                  .copyWith(color: AppColors.grey25),
            ),
          ),
        ],
      ),
    );
  }
}
