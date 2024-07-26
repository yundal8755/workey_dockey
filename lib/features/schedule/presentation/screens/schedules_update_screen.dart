// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:workeydockey/common/constants/app_colors.dart';
// import 'package:workeydockey/common/constants/image_paths.dart';
// import 'package:workeydockey/common/layout/schedules_default_layout.dart';
// import 'package:workeydockey/common/routes.dart';
// import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/button/save_button.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/tile/date_selection_tile.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/tile/employee_selection_tile.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/tile/memo_textfield_tile.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/role_widgets/select_role_tile.dart';
// import 'package:workeydockey/features/schedule/presentation/widgets/tile/time_selection_tile.dart';

// class SchedulesUpdateScreen extends ConsumerStatefulWidget {
//   final Map<String, dynamic> schedule;
//   const SchedulesUpdateScreen({super.key, required this.schedule});

//   @override
//   SchedulesUpdateScreenState createState() => SchedulesUpdateScreenState();
// }

// class SchedulesUpdateScreenState extends ConsumerState<SchedulesUpdateScreen> {
//   late SchedulesController schedulesController;

//   @override
//   void initState() {
//     super.initState();
//     schedulesController = SchedulesController();

//     // 전달된 schedule 값을 사용하여 초기화
//     var schedule = widget.schedule;
//     schedulesController.selectedAvatarBackgroundColor =
//         ValueNotifier<Color?>(schedule['avatarBackgroundColor']);
//     schedulesController.selectedAvatarTextColor =
//         ValueNotifier<Color?>(schedule['avatarTextColor']);
//     schedulesController.id = schedule['id']!;
//     schedulesController.id = schedule['id']!;
//     schedulesController.startTime.value = schedule['startTime']!;
//     schedulesController.endTime.value = schedule['endTime']!;
//     schedulesController.selectedEmployee.value = schedule['employee'];
//     schedulesController.selectedRole.value = schedule['role'];
//     schedulesController.memoController.text = schedule['memo'] ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: SchedulesDefaultLayout(
//         title: '근무 일정 변경',
//         action: GestureDetector(
//           onTap: () {
//             schedulesController.deleteSchedule(context, ref);
//             context.push(AppRoute.schedules.path);
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: AppColors.grey100,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.only(right: 16),
//             child: Image.asset(
//               ImagePaths.trashIcon,
//               width: 20,
//               height: 20,
//             ),
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               DateSelectionTile(controller: schedulesController),
//               TimeSelectionTile(
//                 title: '시작 시간',
//                 onTap: () => schedulesController.selectTime(context, true),
//               ),
//               TimeSelectionTile(
//                 title: '종료 시간',
//                 onTap: () => schedulesController.selectTime(context, false),
//               ),
//               EmployeeSelectionTile(schedulesController: schedulesController),
//               SelectRoleTile(controller: schedulesController),
//               MemoTextfieldTile(controller: schedulesController),
//               SaveButton(controller: schedulesController)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
