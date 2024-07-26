import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';

class TimeSelectController extends StateNotifier<Map<String, TimeOfDay?>> {
  TimeSelectController()
      : super({
          'startTime': const TimeOfDay(hour: 9, minute: 0),
          'endTime': const TimeOfDay(hour: 17, minute: 0),
        });

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? state['startTime']! : state['endTime']!,
      builder: (BuildContext context, Widget? child) {
        return _timePickerTheme(context, child!);
      },
    );

    if (pickedTime != null) {
      if (isStartTime) {
        state = {...state, 'startTime': pickedTime};
      } else {
        state = {...state, 'endTime': pickedTime};
      }
    }
  }

  Widget _timePickerTheme(BuildContext context, Widget child) {
    return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: AppColors.brand500, onSurface: AppColors.grey900),
          timePickerTheme: TimePickerThemeData(
            dayPeriodColor: WidgetStateColor.resolveWith((states) =>
                states.contains(WidgetState.selected)
                    ? AppColors.brand500
                    : AppColors.brand50),
          ),
        ),
        child: child);
  }
}

final timeSelectionProvider =
    StateNotifierProvider<TimeSelectController, Map<String, TimeOfDay?>>(
        (ref) => TimeSelectController());
