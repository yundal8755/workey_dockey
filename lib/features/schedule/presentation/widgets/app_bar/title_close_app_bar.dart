import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class TitleCloseAppBar extends StatelessWidget {
  final String title;

  const TitleCloseAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImagePaths.closeButtonIcon,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Text(
            title,
            style: AppTextTheme.lg.medium.copyWith(color: AppColors.grey600),
          ),
          const SizedBox(
            width: 40,
            height: 40,
          )
        ],
      ),
    );
  }
}
