import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/home/presentation/widgets/home_schedule_detail_info.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';

class UpcomingScheduleSection extends ConsumerWidget {
  const UpcomingScheduleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listData = ref.watch(listDataProvider);
    var schedule = listData.scheduleList;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '다가오는 일정 (2)',
            style: AppTextTheme.lg.semiBold,
          ),
          Gap.size08,
          Column(
            children: [
              //! for문으로 표시하기
              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.grey200,
                backgroundColor: Colors.transparent,
                iconColor: AppColors.grey900,
                featuredIconBorderColor: AppColors.grey300,
              ),

              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.grey200,
                backgroundColor: Colors.transparent,
                iconColor: AppColors.grey900,
                featuredIconBorderColor: AppColors.grey300,
              )
            ],
          )
        ],
      ),
    );
  }
}
