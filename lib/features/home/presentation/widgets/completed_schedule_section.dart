// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/home/presentation/widgets/home_schedule_detail_info.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';

class CompletedScheduleSection extends ConsumerWidget {
  const CompletedScheduleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listData = ref.watch(listDataProvider);
    var schedule = listData.scheduleList;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '완료된 근무 (3)',
                style: AppTextTheme.lg.semiBold,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.grey500,
                ),
              )
            ],
          ),
          Gap.size08,
          Column(
            children: [
              //! for문으로 표시하기
              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.brand500,
                backgroundColor: AppColors.brand500,
                iconColor: Colors.white,
                featuredIconBorderColor: AppColors.grey300,
              ),

              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.brand500,
                backgroundColor: AppColors.brand500,
                iconColor: Colors.white,
                featuredIconBorderColor: AppColors.grey300,
              ),

              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.brand500,
                backgroundColor: AppColors.brand500,
                iconColor: Colors.white,
                featuredIconBorderColor: AppColors.grey300,
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppColor {}
