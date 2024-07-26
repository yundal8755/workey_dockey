import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateSelectController extends StateNotifier<DateTime> {
  // 초기값은 현재 시간
  DateSelectController() : super(DateTime.now());

  void updateDate(DateTime newDate) {
    state = newDate;
  }
}

final dateSelectionProvider =
    StateNotifierProvider<DateSelectController, DateTime>(
  (ref) => DateSelectController(),
);
