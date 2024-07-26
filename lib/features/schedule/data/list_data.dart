// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListData extends ChangeNotifier {

  List<String> roleList = ['홀서빙', '주방', '매니저'];
  List<Map<String, dynamic>> scheduleList = [];

  //! 스케줄 CRUD
  void addSchedule(Map<String, dynamic> schedule) {
    scheduleList.add(schedule);
    notifyListeners();
  }

  void updateSchedule(Map<String, dynamic> updatedSchedule) {
    // 기존 스케줄 리스트에서 스케줄을 찾아 수정
    for (var i = 0; i < scheduleList.length; i++) {
      if (scheduleList[i]['id'] == updatedSchedule['id']) {
        scheduleList[i] = updatedSchedule;
        notifyListeners();
        return;
      }
    }
    print('스케줄을 찾을 수 없습니다.');
  }

  void deleteSchedule(String id) {
    scheduleList.removeWhere((schedule) => schedule['id'] == id);
    notifyListeners();
  }

  //! 역할 CRUD
  void addRole(String role) {
    roleList.add(role);
    notifyListeners();
  }

  void updateRole(String oldRole, String newRole) {
    int index = roleList.indexOf(oldRole);
    if (index != -1) {
      roleList[index] = newRole;
      notifyListeners();
    }
  }

  void deleteRole(String role) {
    roleList.remove(role);
    notifyListeners();
  }
}

final listDataProvider = ChangeNotifierProvider<ListData>(
  (ref) {
    return ListData();
  },
);
