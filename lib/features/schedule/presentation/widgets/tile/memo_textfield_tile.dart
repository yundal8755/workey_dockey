import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';

class MemoTextfieldTile extends StatelessWidget {
  final SchedulesController controller;
  const MemoTextfieldTile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.grey200),
        ),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '메모',
            style: AppTextTheme.md.regular.copyWith(color: AppColors.grey700),
          ),
          Gap.size12,
          TextFormField(
            controller: controller.memoController,
            decoration: InputDecoration(
              hintText: '근무에 필요한 내용을 적어주세요',
              hintStyle: AppTextTheme.sm.regular.copyWith(color: AppColors.grey400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.grey400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.grey400,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0),
            ),
            style: const TextStyle(fontSize: 12),
            minLines: 5,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            maxLength: 1000,
            buildCounter: (BuildContext context,
                    {int? currentLength, bool? isFocused, int? maxLength}) =>
                null,
          ),
        ],
      ),
    );
  }
}
