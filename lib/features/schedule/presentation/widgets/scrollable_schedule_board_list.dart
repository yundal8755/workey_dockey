import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/schedules_detail_info.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

class ScrollableScheduleBoardList extends ConsumerStatefulWidget {
  final DateTime selectedDate;

  const ScrollableScheduleBoardList({super.key, required this.selectedDate});

  @override
  ScrollableScheduleBoardListState createState() =>
      ScrollableScheduleBoardListState();
}

class ScrollableScheduleBoardListState
    extends ConsumerState<ScrollableScheduleBoardList> {
  final int initialIndex = 365; // 초기 인덱스를 중앙으로 설정하여 음수 인덱스 허용
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
          _calculateScrollOffset(widget.selectedDate)); // 선택된 날짜로 스크롤 위치 설정
    });
  }

  double _calculateScrollOffset(DateTime selectedDate) {
    DateTime today = DateTime.now();
    int daysDifference = selectedDate.difference(today).inDays;
    return (initialIndex + daysDifference) * 116.0; // 추정 픽셀 값으로 스크롤 위치 계산
  }

  @override
  void didUpdateWidget(ScrollableScheduleBoardList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      _scrollController.jumpTo(
          _calculateScrollOffset(widget.selectedDate)); // 날짜 변경 시 스크롤 위치 업데이트
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    final listData = ref.watch(listDataProvider);

    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        int adjustedIndex = index - initialIndex;
        DateTime date = today.add(Duration(days: adjustedIndex));
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        String displayDate = DateFormat('M월 d일 E요일', 'ko_KR').format(date);

        var schedules = listData.scheduleList
            .where((schedule) => schedule['date'] == formattedDate)
            .toList();

        bool isToday = date.year == today.year &&
            date.month == today.month &&
            date.day == today.day;

        return _dailySchedule(displayDate, isToday, schedules, date);
      },
    );
  }

  Widget _dailySchedule(displayDate, isToday, schedules, date) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        children: [
          //! 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(displayDate, // UI 표시용 날짜
                  style: isToday
                      ? AppTextTheme.md.medium
                          .copyWith(color: AppColors.primary)
                      : AppTextTheme.md.medium
                          .copyWith(color: AppColors.grey900)),
              Row(
                children: [
                  Image.asset(
                    ImagePaths.usersIcon,
                    width: 16,
                    height: 16,
                  ),
                  Gap.size04,
                  Text('${schedules.length}',
                      style: AppTextTheme.sm.regular
                          .copyWith(color: AppColors.grey500))
                ],
              )
            ],
          ),

          Gap.size04,

          //! 스케줄 카드
          for (var schedule in schedules)
            SchedulesDetailInfo(schedule: schedule),

          Gap.size04,
          //! 근무 일정 추가 버튼
          SoftButton(
            disabledBackgroundColor: AppColors.brand600,
            backgroundColor: AppColors.grey100,
            onPressed: () => context.push(
              AppRoute.scheduleAdd.path,
              extra: date.toIso8601String(), // 날짜를 ISO 8601 형식으로 변환하여 전달
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: AppColors.grey700,
                ),
                Gap.size08,
                Text(
                  '근무 일정 추가',
                  style:
                      AppTextTheme.sm.medium.copyWith(color: AppColors.grey700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
