// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/layout/schedules_default_layout.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/data/employee_selection_repo.dart';

class EmployeeSelectScreen extends StatelessWidget {
  const EmployeeSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeSelectionRepo employeeSelectionRepository =
        EmployeeSelectionRepo();

    return SchedulesDefaultLayout(
      title: '직원 선택',
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: employeeSelectionRepository.fetchEmployeeInfos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('오류가 발생했습니다.'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('데이터가 없습니다.'));
          }

          List<Map<String, dynamic>> employeeList = snapshot.data!;
          print(employeeList);

          return ListView.builder(
            itemCount: employeeList.length,
            itemBuilder: (context, index) {
              int avatarBackgroundColor = employeeList[index]['avatarBackgroundColor'] ?? 0xFFCCCCCC;
              int avatarTextColor = employeeList[index]['avatarTextColor'] ?? 0xFFFFFFFF;
              String name = employeeList[index]['name'] ?? '';

              Color backgroundColor = Color(avatarBackgroundColor);
              Color textColor = Color(avatarTextColor);

              return GestureDetector(
                onTap: () => context.pop(employeeList[index]),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: backgroundColor,
                        child: Text(
                          name.length >= 3
                              ? name.substring(name.length - 2)
                              : name,
                          style: AppTextTheme.md.medium.copyWith(
                            color: textColor,
                          ),
                        ),
                      ),
                      Gap.size16,
                      Text(
                        name,
                        style: AppTextTheme.lg.medium,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
