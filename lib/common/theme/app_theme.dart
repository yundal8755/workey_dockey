import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    floatingActionButtonTheme: _fabThemeData,
    useMaterial3: false,
    appBarTheme: _appBarTheme,
    textTheme: TextTheme(bodyMedium: AppTextTheme.sm.regular),
    fontFamily: 'Pretendard',
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
  );

  static const FloatingActionButtonThemeData _fabThemeData =
      FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primary,
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    foregroundColor: AppColors.grey600,
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextTheme.lg.medium.copyWith(color: AppColors.grey600),
  );
}

class AppTextTheme {
  static const _xsSize = 12.0;
  static const _smSize = 14.0;
  static const _mdSize = 16.0;
  static const _lgSize = 18.0;
  static const _xlgSize = 20.0;
  static const _displayXsSize = 24.0;

  static const _regularStyle =
      TextStyle(color: AppColors.grey700, fontWeight: FontWeight.w400);
  static const _mediumStyle =
      TextStyle(color: AppColors.grey700, fontWeight: FontWeight.w500);
  static const _semiBoldStyle =
      TextStyle(color: AppColors.grey700, fontWeight: FontWeight.w600);
  static const _boldStyle =
      TextStyle(color: AppColors.grey700, fontWeight: FontWeight.w700);

  static final xs = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _xsSize),
    medium: _mediumStyle.copyWith(fontSize: _xsSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _xsSize),
    bold: _boldStyle.copyWith(fontSize: _xsSize),
  );

  static final sm = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _smSize),
    medium: _mediumStyle.copyWith(fontSize: _smSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _smSize),
    bold: _boldStyle.copyWith(fontSize: _smSize),
  );

  static final md = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _mdSize),
    medium: _mediumStyle.copyWith(fontSize: _mdSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _mdSize),
    bold: _boldStyle.copyWith(fontSize: _mdSize),
  );

  static final lg = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _lgSize),
    medium: _mediumStyle.copyWith(fontSize: _lgSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _lgSize),
    bold: _boldStyle.copyWith(fontSize: _lgSize),
  );

  static final xl = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _xlgSize),
    medium: _mediumStyle.copyWith(fontSize: _xlgSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _xlgSize),
    bold: _boldStyle.copyWith(fontSize: _xlgSize),
  );

  static final displayXs = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _displayXsSize),
    medium: _mediumStyle.copyWith(fontSize: _displayXsSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _displayXsSize),
    bold: _boldStyle.copyWith(fontSize: _displayXsSize),
  );
}

class TextWeight {
  TextStyle regular;
  TextStyle medium;
  TextStyle semiBold;
  TextStyle bold;

  TextWeight({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });
}
