// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class SchedulesAddListTile extends StatelessWidget {
  final String title;
  final String content;

  const SchedulesAddListTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.grey200, width: 1)),
          color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.md.regular.copyWith(color: AppColors.grey700),
          ),
          Text(content, style: AppTextTheme.lg.medium.copyWith(color: AppColors.grey700),)
        ],
      ),
    );
  }
}
