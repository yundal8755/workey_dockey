import 'package:flutter/material.dart';
import 'package:workeydockey/common/widgets/bottom_sheet.dart';
import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/bottom_sheet/role_selection_bottom_sheet.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/tile/schedules_add_list_tile.dart';

class RoleSelectTile extends StatelessWidget {
  final SchedulesController controller;

  const RoleSelectTile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheet(
            context: context,
            child: RoleSelectionBottomSheet(
              controller: controller,
            ),
            height: MediaQuery.of(context).size.height / 2,
            backgroundColor: Colors.white);
      },
      child: SchedulesAddListTile(
        title: '역할',
        content: '역할을 선택해주세요',
      ),
    );
  }
}
