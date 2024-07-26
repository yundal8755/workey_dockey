import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/common/widgets/featured_icon.dart';

class HomeSchedulesDetailInfo extends StatelessWidget {
  String imagePaths;
  double size;
  Color backgroundColor;
  Color iconColor;
  Color featuredIconBorderColor;
  Color scheduleDetailInfoBorderColor;

  HomeSchedulesDetailInfo(
      {super.key,
      this.imagePaths = ImagePaths.calendarCheckIcon,
      required this.backgroundColor,
      required this.iconColor,
      required this.scheduleDetailInfoBorderColor,
      this.featuredIconBorderColor = Colors.transparent,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: scheduleDetailInfoBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            FeaturedIcon(
              imagePaths: imagePaths,
              backgroundColor: backgroundColor,
              iconColor: iconColor,
              borderColor: featuredIconBorderColor,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '김윤수',
                  style: AppTextTheme.md.semiBold
                      .copyWith(color: AppColors.grey700),
                ),
                Row(
                  children: [
                    Text('오늘', style: AppTextTheme.sm.semiBold),
                    Gap.size08,
                    Text(
                      '오전 9:00 - 오후 3:00',
                      style: AppTextTheme.sm.regular
                          .copyWith(color: AppColors.grey600),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
