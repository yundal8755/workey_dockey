import 'dart:ui';

class Schedule {
  final Color avatarBackgroundColor;
  final Color avatarTextColor;
  final String date;
  final String employeeName;
  final String endTime;
  final String id;
  final String memo;
  final String role;
  final String startTime;

  Schedule({
    required this.avatarBackgroundColor,
    required this.avatarTextColor,
    required this.date,
    required this.employeeName,
    required this.endTime,
    required this.id,
    required this.memo,
    required this.role,
    required this.startTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'avatarBackgroundColor': avatarBackgroundColor,
      'avatarTextColor': avatarTextColor,
      'id': id,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'employee': employeeName,
      'role': role,
      'memo': memo,
    };
  }
}
