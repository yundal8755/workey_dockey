import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/state/date_select_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/date_picker.dart';
import 'package:intl/intl.dart';

class DatePickerWrapper extends ConsumerWidget {
  final DateTime selectedDate;

  const DatePickerWrapper({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateSelectionProvider);

    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.grey25,
                contentPadding: EdgeInsets.zero,
                content: DatePicker(selectedDate: selectedDate),
              );
            },
          );
        },
        child: IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(left: 24.0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey300),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Text(
                  DateFormat('yyyy년 M월').format(selectedDate), // 날짜 형식 업데이트
                  style: AppTextTheme.sm.semiBold
                      .copyWith(color: AppColors.grey500),
                ),
                Gap.size08,
                Image.asset(ImagePaths.caretDownIcon, width: 20, height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
