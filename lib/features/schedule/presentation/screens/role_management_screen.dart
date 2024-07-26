import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/layout/schedules_default_layout.dart';
import 'package:workeydockey/common/widgets/bottom_sheet.dart';
import 'package:workeydockey/features/schedule/data/role_management_repo.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/custom_floating_button.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/bottom_sheet/add_role_bottom_sheet.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/item_tile/role_management_item_tile.dart';

class RoleManagementScreen extends ConsumerWidget {
  const RoleManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleSelectionRepo = RoleManagementRepo();

    return SchedulesDefaultLayout(
      title: '역할',
      child: Stack(
        children: [
          StreamBuilder<List<String>>(
            stream: roleSelectionRepo.fetchRoleList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('오류가 발생했습니다.'));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('데이터가 없습니다.'));
              }

              List<String> roleList = snapshot.data!;

              return ListView.builder(
                itemCount: roleList.length,
                itemBuilder: (context, index) {
                  return RoleManagementTile(roleName: roleList[index]);
                },
              );
            },
          ),
          CustomFloatingButton(
              onPressed: () => bottomSheet(
                  context: context,
                  child: const AddRoleBottonSheet(),
                  height: MediaQuery.of(context).size.height / 1.5,
                  backgroundColor: Colors.white),
              backgroundColor: AppColors.brand600,
              icon: ImagePaths.plusIcon)
        ],
      ),
    );
  }
}
