// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class SchedulesAddEmployeeTile extends StatelessWidget {
  final String title;
  final String content;
  final Color avatarBackgroundColor;
  final Color avatarTextColor;

  const SchedulesAddEmployeeTile({
    super.key,
    required this.title,
    required this.content,
    required this.avatarBackgroundColor,
    required this.avatarTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.grey200, width: 1)),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.md.regular.copyWith(color: AppColors.grey700),
          ),
          Row(
            children: [
              if (content != null && content != '직원을 선택해주세요') ...[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: avatarBackgroundColor,
                  child: Text(
                    content.isNotEmpty
                        ? content.substring(content.length - 2)
                        : '',
                    style: AppTextTheme.md.medium.copyWith(
                      color: avatarTextColor,
                    ),
                  ),
                ),
                Gap.size10
              ],
              Text(
                content,
                style:
                    AppTextTheme.lg.medium.copyWith(color: AppColors.grey700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
