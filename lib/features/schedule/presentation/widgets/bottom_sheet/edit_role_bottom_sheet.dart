import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/custom_alert_dialog.dart';

class EditRoleBottomSheet extends ConsumerStatefulWidget {
  final String roleName;

  const EditRoleBottomSheet({super.key, required this.roleName});

  @override
  EditRoleBottomSheetState createState() => EditRoleBottomSheetState();
}

class EditRoleBottomSheetState extends ConsumerState<EditRoleBottomSheet> {
  final TextEditingController roleNameController = TextEditingController();
  final FocusNode roleNameFocusNode = FocusNode();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    roleNameController.text = widget.roleName;
    roleNameController.addListener(checkInput);

    // 키보드를 바로 올리기 위해 TextFormField에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      roleNameFocusNode.requestFocus();
    });
  }

  void checkInput() {
    setState(() {
      isButtonEnabled = roleNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listData = ref.watch(listDataProvider);

    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
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
                  widget.roleName,
                  style:
                      AppTextTheme.lg.medium.copyWith(color: AppColors.grey600),
                ),
                GestureDetector(
                  onTap: () => CustomAlertDialog.showTwoOptionDialog(
                    context: context,
                    title: '역할을 삭제하시겠습니까?',
                    message: '이 역할을 가진 모든 사용자의 역할이 초기화됩니다',
                    onTap: () {
                      // 삭제 메소드 구현하기
                      listData.deleteRole(widget.roleName);

                      // 뒤로 가기 (알림창 닫기, 모달창 닫기)
                      context.pop();
                      context.pop();
                    },
                    buttonText: '삭제하기',
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      ImagePaths.trashIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: TextFormField(
              focusNode: roleNameFocusNode,
              controller: roleNameController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30), // 입력 길이를 30자로 제한
              ],
              decoration: InputDecoration(
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
              style: AppTextTheme.md.regular.copyWith(color: AppColors.grey900),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              maxLength: 1000,
              buildCounter: (BuildContext context,
                      {int? currentLength, bool? isFocused, int? maxLength}) =>
                  null,
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SoftButton(
              backgroundColor: AppColors.brand600,
              disabledBackgroundColor: AppColors.brand600.withOpacity(0.5),
              onPressed: isButtonEnabled
                  ? () {
                      // 역할 수정하기
                      final String newRole = roleNameController.text;
                      listData.updateRole(widget.roleName, newRole);
                      print(listData.roleList);

                      // 뒤로 이동하기
                      context.pop();
                    }
                  : null,
              child: Text(
                '수정하기',
                style:
                    AppTextTheme.md.semiBold.copyWith(color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
