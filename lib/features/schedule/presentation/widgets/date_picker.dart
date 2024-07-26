import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/state/date_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

class DatePicker extends ConsumerStatefulWidget {
  final DateTime? selectedDate;
  const DatePicker({super.key, this.selectedDate});

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends ConsumerState<DatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 년월 표시
          _yearMonthPicker(),

          // 날짜 선택 버튼
          _dateSelectionButtons(),

          // 캘린더
          _buildCalendar(),

          // 하단 버튼
          _bottomActionButtons(),
        ],
      ),
    );
  }

  Widget _yearMonthPicker() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              iconSize: 36,
              icon:
                  Image.asset(ImagePaths.caretLeftIcon, width: 16, height: 16),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(_selectedDate.year,
                      _selectedDate.month - 1, _selectedDate.day);
                });
              }),
          Text(
            DateFormat('yyyy년 M월').format(_selectedDate),
            style: AppTextTheme.md.medium.copyWith(color: AppColors.grey700),
          ),
          IconButton(
            iconSize: 36,
            icon: Image.asset(ImagePaths.caretRightIcon, width: 16, height: 16),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime(_selectedDate.year,
                    _selectedDate.month + 1, _selectedDate.day);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _dateSelectionButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: SoftButton(
              backgroundColor: AppColors.grey25,
              onPressed: null,
              borderSideColor: AppColors.grey300,
              child: Text(
                DateFormat('yyyy년 M월 d일').format(_selectedDate),
                style:
                    AppTextTheme.sm.semiBold.copyWith(color: AppColors.grey700),
              ),
            ),
          ),
          Gap.size12,
          SoftButton(
            backgroundColor: AppColors.grey25,
            onPressed: () {
              setState(() {
                _selectedDate = DateTime.now();
              });
            },
            borderSideColor: AppColors.grey300,
            child: Text(
              '오늘',
              style:
                  AppTextTheme.sm.semiBold.copyWith(color: AppColors.grey700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    final List<String> weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    DateTime firstDayOfMonth =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    int firstWeekdayOfMonth = (firstDayOfMonth.weekday + 6) % 7; // 월요일을 0으로 시작
    DateTime today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 20),
      child: Table(
        children: [
          TableRow(
            children: weekdays.map((day) {
              return Center(
                child: Text(
                  day,
                  style: AppTextTheme.sm.semiBold
                      .copyWith(color: AppColors.grey700),
                ),
              );
            }).toList(),
          ),
          ...List.generate(
            6,
            (weekIndex) {
              return TableRow(
                children: List.generate(
                  7,
                  (dayIndex) {
                    int dayOffset =
                        weekIndex * 7 + dayIndex - firstWeekdayOfMonth;
                    DateTime day = DateTime(
                        _selectedDate.year, _selectedDate.month, 1 + dayOffset);
                    bool isToday = day.year == today.year &&
                        day.month == today.month &&
                        day.day == today.day;
                    bool isSelected = day.year == _selectedDate.year &&
                        day.month == _selectedDate.month &&
                        day.day == _selectedDate.day;
                    bool isDifferentMonth = day.month != _selectedDate.month;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDate = day;
                        });
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: isSelected
                                ? AppColors.brand600
                                : isToday
                                    ? AppColors.grey100
                                    : Colors.transparent,
                            child: Text(
                              day.day.toString(),
                              style: AppTextTheme.sm.regular.copyWith(
                                color: isSelected
                                    ? AppColors.grey25
                                    : isDifferentMonth
                                        ? AppColors.grey400
                                        : AppColors.grey700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _bottomActionButtons() {
    final selectedDateNotifier = ref.read(dateSelectionProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.grey200))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SoftButton(
              width: MediaQuery.of(context).size.width,
              backgroundColor: AppColors.grey25,
              onPressed: () => context.pop(),
              borderSideColor: AppColors.grey300,
              child: Text(
                '취소',
                style:
                    AppTextTheme.sm.semiBold.copyWith(color: AppColors.grey700),
              ),
            ),
          ),
          Gap.size20,
          Expanded(
            child: SoftButton(
              width: MediaQuery.of(context).size.width,
              backgroundColor: AppColors.brand600,
              onPressed: () {
                selectedDateNotifier.updateDate(_selectedDate);
                context.pop();
              },
              disabledBackgroundColor: Colors.transparent,
              child: Text(
                '적용하기',
                style:
                    AppTextTheme.sm.semiBold.copyWith(color: AppColors.grey25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
