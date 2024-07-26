// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/home/presentation/widgets/completed_schedule_section.dart';
import 'package:workeydockey/features/home/presentation/widgets/in_progress_schedule_section.dart';
import 'package:workeydockey/features/home/presentation/widgets/quick_access_items.dart';
import 'package:workeydockey/features/home/presentation/widgets/upcoming_schedule_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '워키도키',
            style: AppTextTheme.lg.bold,
          ),
        ),
        actions: [
          Image.asset(
            ImagePaths.bellIcon,
            width: 20,
            height: 20,
          ),
          Gap.size08,
          CircleAvatar(
            backgroundColor: AppColors.brand50,
            child: Image.asset(
              ImagePaths.userIcon,
              width: 24,
              height: 24,
              color: AppColors.brand500,
            ),
          ),
          Gap.size24,
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //! 바로가기
                  const QuickAccessItems(),

                  Gap.size24,
                  const InProgressScheduleSection(),

                  Gap.size24,
                  const UpcomingScheduleSection(),
                ],
              ),
            )),
      ),
    );
  }
}
