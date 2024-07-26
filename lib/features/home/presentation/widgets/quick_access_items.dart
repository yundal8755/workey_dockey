import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/common/widgets/featured_icon.dart';

class QuickAccessItems extends StatelessWidget {
  const QuickAccessItems({super.key});

  @override
  Widget build(BuildContext context) {
    return //! 바로가기
        SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '바로가기',
            style: AppTextTheme.lg.semiBold,
          ),
          Gap.size08,
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('제스처디텍터');
                    context.push(AppRoute.users.path);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(color: AppColors.grey200, width: 1.0),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FeaturedIcon(
                            imagePaths: ImagePaths.usersIcon,
                            backgroundColor: AppColors.blue100,
                            iconColor: AppColors.blue500),
                        Gap.size08,
                        Text('사용자', style: AppTextTheme.sm.medium)
                      ],
                    ),
                  ),
                ),
              ),
              Gap.size16,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('제스처디텍터');
                    context.push(AppRoute.schedules.path);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(color: AppColors.grey200, width: 1.0),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FeaturedIcon(
                            imagePaths: ImagePaths.calendarCheckIcon,
                            backgroundColor: AppColors.orange100,
                            iconColor: AppColors.warning600),
                        Gap.size08,
                        Text('일정 관리', style: AppTextTheme.sm.medium)
                      ],
                    ),
                  ),
                ),
              ),
              Gap.size16,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('제스처디텍터');
                    context.push(AppRoute.workRecords.path);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(color: AppColors.grey200, width: 1.0),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FeaturedIcon(
                            imagePaths: ImagePaths.usersIcon,
                            backgroundColor: AppColors.error100,
                            iconColor: AppColors.error600),
                        Gap.size08,
                        Text('근무 기록', style: AppTextTheme.sm.medium)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
