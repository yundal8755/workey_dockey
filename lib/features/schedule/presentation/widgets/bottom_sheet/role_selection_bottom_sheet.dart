import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/routes.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';
import 'package:workeydockey/features/schedule/data/role_management_repo.dart';
import 'package:workeydockey/features/schedule/presentation/controllers/schedules_controller.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/item_tile/role_selection_item_tile.dart';

class RoleSelectionBottomSheet extends ConsumerStatefulWidget {
  final SchedulesController controller;

  const RoleSelectionBottomSheet({super.key, required this.controller});

  @override
  ConsumerState<RoleSelectionBottomSheet> createState() =>
      _PickRoleBottomSheetState();
}

class _PickRoleBottomSheetState
    extends ConsumerState<RoleSelectionBottomSheet> {
  late List<bool> _selectedRoles;

  @override
  void initState() {
    super.initState();
    final listData = ref.read(listDataProvider);

    _selectedRoles = List<bool>.generate(
      listData.roleList.length,
      (index) =>
          listData.roleList[index] == widget.controller.selectedRole.value,
    );
  }

  void _handleRoleSelection(int index, bool? selected) {
    setState(() {
      for (int i = 0; i < _selectedRoles.length; i++) {
        _selectedRoles[i] = i == index ? (selected ?? false) : false;
      }
    });
  }

  void _applySelection() {
    final listData = ref.read(listDataProvider);

    // Ensure _selectedRoles and listData.roleList have the same length
    if (_selectedRoles.length != listData.roleList.length) {
      _selectedRoles = List<bool>.generate(
        listData.roleList.length,
        (index) =>
            index < _selectedRoles.length ? _selectedRoles[index] : false,
      );
    }

    final selectedRoles = listData.roleList
        .asMap()
        .entries
        .where((entry) {
          return entry.key < _selectedRoles.length && _selectedRoles[entry.key];
        })
        .map((entry) => entry.value)
        .toList();

    if (selectedRoles.isNotEmpty) {
      widget.controller.selectRole(selectedRoles.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    final listData = ref.watch(listDataProvider);
    final roleManagementRepo = RoleManagementRepo();

    // 새로 추가된 항목에 대해 _selectedRoles 업데이트
    if (_selectedRoles.length != listData.roleList.length) {
      setState(() {
        _selectedRoles = List<bool>.generate(
          listData.roleList.length,
          (index) =>
              index < _selectedRoles.length ? _selectedRoles[index] : false,
        );
      });
    }

    return SafeArea(
      child: Column(
        children: [
          _header(),
          _roleList(context, roleManagementRepo, listData),
          _footer()
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _applySelection();
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImagePaths.closeButtonIcon,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Text(
            '역할 선택',
            style: AppTextTheme.lg.medium.copyWith(color: AppColors.grey600),
          ),
          GestureDetector(
            onTap: () {
              _applySelection();
              context.push(AppRoute.roleManagement.path);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                ImagePaths.pencilSimpleIcon,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleList(BuildContext context, roleManagementRepo, listData) {
    return Expanded(
      child: StreamBuilder<List<String>>(
        stream: roleManagementRepo.fetchRoleList(),
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
              bool isSelected =
                  index < _selectedRoles.length && _selectedRoles[index];

              return RoleItemTile(
                title: roleList[index],
                isSelected: isSelected,
                onChanged: (selected) => _handleRoleSelection(index, selected),
              );
            },
          );
        },
      ),
    );
  }

  Widget _footer() {
    bool isAnyRoleSelected = _selectedRoles.contains(true);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SoftButton(
        disabledBackgroundColor: AppColors.brand600.withOpacity(0.5),
        backgroundColor: AppColors.brand600,
        onPressed: isAnyRoleSelected
            ? () {
                _applySelection();
                context.pop();
              }
            : null,
        child: Text(
          '선택하기',
          style: AppTextTheme.md.semiBold.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
