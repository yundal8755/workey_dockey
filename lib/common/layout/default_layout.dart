import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';

class DefaultLayout extends StatelessWidget {
  final Widget? child;
  final String? title;
  final VoidCallback? onBackPressed;
  final Widget? action;
  final FloatingActionButton? floatingActionButton;

  const DefaultLayout({
    this.child,
    this.title,
    this.onBackPressed,
    this.action,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      floatingActionButton: floatingActionButton,
      backgroundColor: AppColors.grey25,
      body: child,
    );
  }

  AppBar? renderAppBar() {
    const leadingIconSize = 24.0;
    const leadingSize = 40.0;

    if (title == null && onBackPressed == null) {
      return null;
    }

    return AppBar(
      backgroundColor: AppColors.grey25,
      title: title == null ? null : Text(title!),
      leading: onBackPressed == null
          ? null
          : IconButton(
              onPressed: onBackPressed,
              icon:
                  Image.asset(ImagePaths.caretLeftIcon, width: leadingIconSize),
              splashRadius: leadingSize / 2,
            ),
      actions: action == null ? null : [action!],
      centerTitle: true,
    );
  }
}
