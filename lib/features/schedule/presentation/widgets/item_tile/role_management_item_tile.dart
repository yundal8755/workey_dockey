import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/common/widgets/bottom_sheet.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/bottom_sheet/edit_role_bottom_sheet.dart';

class RoleManagementTile extends StatelessWidget {
  final String roleName;
  const RoleManagementTile({super.key, required this.roleName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheet(
            context: context,
            child: EditRoleBottomSheet(
              roleName: roleName,
            ),
            height: MediaQuery.of(context).size.height / 1.5,
            backgroundColor: Colors.white);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: AppColors.grey200),
          ),
        ),
        child: Text(roleName, style: AppTextTheme.lg.regular),
      ),
    );
  }
}
