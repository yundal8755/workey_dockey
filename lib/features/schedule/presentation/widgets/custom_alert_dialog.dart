import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

class CustomAlertDialog {
  static void showTwoOptionDialog(
      {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onTap,
      required String buttonText}) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.75),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(title,
              style:
                  AppTextTheme.lg.semiBold.copyWith(color: AppColors.grey900)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message,
                    style: AppTextTheme.sm.regular
                        .copyWith(color: AppColors.grey600)),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SoftButton(
                    backgroundColor: AppColors.white,
                    borderSideColor: AppColors.grey300,
                    onPressed: () => context.pop(),
                    child: Text(
                      '취소',
                      style: AppTextTheme.md.semiBold
                          .copyWith(color: AppColors.grey700),
                    ),
                  ),
                ),
                Gap.size12,
                Expanded(
                  child: SoftButton(
                    backgroundColor: AppColors.brand600,
                    onPressed: onTap,
                    child: Text(
                      buttonText,
                      style: AppTextTheme.md.semiBold
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
