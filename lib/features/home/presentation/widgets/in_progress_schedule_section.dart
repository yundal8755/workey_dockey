import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/home/presentation/widgets/home_schedule_detail_info.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';

class InProgressScheduleSection extends ConsumerWidget {
  const InProgressScheduleSection({super.key});

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
            '진행중인 근무 (1)',
            style: AppTextTheme.lg.semiBold,
          ),
          Gap.size08,
          Column(
            children: [
              //! for문으로 표시하기
              HomeSchedulesDetailInfo(
                scheduleDetailInfoBorderColor: AppColors.blue500,
                backgroundColor: AppColors.blue500,
                iconColor: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
