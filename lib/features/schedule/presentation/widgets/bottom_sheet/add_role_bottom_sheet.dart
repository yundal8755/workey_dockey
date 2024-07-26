import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/theme/app_theme.dart';
import 'package:workeydockey/features/schedule/data/list_data.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/app_bar/%08title_close_app_bar.dart';
import 'package:workeydockey/features/schedule/presentation/widgets/button/soft_button.dart';

class AddRoleBottonSheet extends ConsumerStatefulWidget {
  const AddRoleBottonSheet({super.key});

  @override
  NewRoleBottomSheetState createState() => NewRoleBottomSheetState();
}

class NewRoleBottomSheetState extends ConsumerState<AddRoleBottonSheet> {
  final TextEditingController roleNameController = TextEditingController();
  final FocusNode roleNameFocusNode = FocusNode();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    roleNameController.addListener(_checkInput);

    // 키보드를 바로 올리기 위해 TextFormField에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      roleNameFocusNode.requestFocus();
    });
  }

  void _checkInput() {
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
          const TitleCloseAppBar(title: '새로운 역할'),
          _customTextField(),
          _addButton(listData),
        ],
      ),
    );
  }

  Widget _customTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: TextFormField(
        focusNode: roleNameFocusNode,
        controller: roleNameController,
        inputFormatters: [
          LengthLimitingTextInputFormatter(30), // 입력 길이를 30자로 제한
        ],
        decoration: InputDecoration(
          hintText: '역할을 입력해주세요',
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
        style: const TextStyle(fontSize: 12),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        maxLength: 1000,
        buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) =>
            null,
      ),
    );
  }

  Widget _addButton(listData) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SoftButton(
        backgroundColor: AppColors.brand600,
        disabledBackgroundColor: AppColors.brand600.withOpacity(0.5),
        onPressed: isButtonEnabled
            ? () {
                // 역할 추가하기
                final String role = roleNameController.text;
                listData.addRole(role);
                print(listData.roleList);

                // 뒤로 이동하기
                context.pop();
              }
            : null,
        child: Text(
          '추가하기',
          style: AppTextTheme.md.semiBold.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
