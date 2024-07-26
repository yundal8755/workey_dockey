import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class SchedulesDefaultLayout extends StatelessWidget {
  final Widget? child;
  final String? title;
  final VoidCallback? onBackPressed;
  final Widget? action;
  final PreferredSizeWidget? appbarBottomWidget;

  const SchedulesDefaultLayout({
    this.child,
    this.title,
    this.onBackPressed,
    this.action,
    this.appbarBottomWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const leadingIconSize = 24.0;
    const leadingSize = 40.0;

    return Scaffold(
      backgroundColor: AppColors.grey25,
      appBar: AppBar(
        backgroundColor: AppColors.grey25,
        surfaceTintColor: AppColors.grey25,
        bottom: appbarBottomWidget,
        title: title == null
            ? null
            : Text(
                title!,
                style:
                    AppTextTheme.lg.medium.copyWith(color: AppColors.grey600),
              ),
        leading: onBackPressed == null
            ? null
            : IconButton(
                onPressed: onBackPressed,
                icon: Image.asset(ImagePaths.caretLeftIcon,
                    width: leadingIconSize),
                splashRadius: leadingSize / 2,
              ),
        actions: action == null ? null : [action!],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: child),
      ),
    );
  }
}
