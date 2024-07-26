import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:workeydockey/features/schedule/domain/schedule.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';

class SchedulesController {
  final TextEditingController memoController = TextEditingController();
  final uuid = const Uuid();
  late String id = uuid.v4();

  // 역할
  final ValueNotifier<String?> selectedRole = ValueNotifier<String?>(null);

  // 시간 포맷 (DateTime)
  DateTime parseTime(String time) {
    final period = time.split(' ')[0];
    final hourMinute = time.split(' ')[1].split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);

    if (period == '오후' && hour != 12) {
      hour += 12;
    } else if (period == '오전' && hour == 12) {
      hour = 0;
    }

    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  // //! 직원 선택
  // void selectEmployee(Map<String, dynamic> employeeData) {
  //   selectedEmployee.value = employeeData['userName'];
  //   selectedAvatarBackgroundColor.value = employeeData['avatarBackgroundColor'];
  //   selectedAvatarTextColor.value = employeeData['avatarTextColor'];
  // }

  //! 역할 선택
  void selectRole(String role) {
    selectedRole.value = role;
  }

  // //! 스케줄 추가하기
  // void addSchedule(BuildContext context, WidgetRef ref) {
  //   final listData = ref.read(listDataProvider);
  //   final schedule = Schedule(
  //     avatarBackgroundColor: '',
  //     avatarTextColor: '',
  //     id: id.isEmpty ? uuid.v4() : id,
  //     date: '',
  //     startTime: '',
  //     endTime: '',
  //     employeeName: selectedEmployee.value!,
  //     role: selectedRole.value!,
  //     memo: memoController.text,
  //   );
  //   listData.addSchedule(schedule.toMap());
  // }

  // //! 스케줄 업데이트하기
  // void updateSchedule(BuildContext context, WidgetRef ref) {
  //   final listData = ref.read(listDataProvider);
  //   final schedule = Schedule(
  //     avatarBackgroundColor: selectedAvatarBackgroundColor.value!,
  //     avatarTextColor: selectedAvatarTextColor.value!,
  //     id: id.isEmpty ? uuid.v4() : id,
  //     date: '',
  //     startTime: '',
  //     endTime: '',
  //     employeeName: selectedEmployee.value!,
  //     role: selectedRole.value!,
  //     memo: memoController.text,
  //   );
  //   listData.updateSchedule(schedule.toMap());
  // }

  //! 스케줄 삭제하기
  void deleteSchedule(BuildContext context, WidgetRef ref) {
    final listData = ref.read(listDataProvider);
    listData.deleteSchedule(id);
  }
}
