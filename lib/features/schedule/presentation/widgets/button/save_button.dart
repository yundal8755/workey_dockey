// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:workeydockey/common/constants/app_colors.dart';
// import 'package:workeydockey/common/theme/app_theme.dart';
// import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

// class SaveButton extends ConsumerWidget {
//   final SchedulesController controller;
//   const SaveButton({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: ValueListenableBuilder<String?>(
//         valueListenable: controller.selectedRole,
//         builder: (context, role, child) {
//           final isButtonEnabled = employee != null && role != null;
//           return SoftButton(
//             width: MediaQuery.of(context).size.width,
//             disabledBackgroundColor: AppColors.brand600.withOpacity(0.5),
//             backgroundColor: AppColors.brand600,
//             onPressed: isButtonEnabled
//                 ? () {
//                     controller.addSchedule(context, ref);
//                     context.pop();
//                   }
//                 : null,
//             child: Text(
//               '저장하기',
//               style: AppTextTheme.md.semiBold
//                   .copyWith(color: AppColors.grey25),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
