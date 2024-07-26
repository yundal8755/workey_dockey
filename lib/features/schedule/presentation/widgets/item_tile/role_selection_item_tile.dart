import 'package:flutter/material.dart';
import 'package:workeydockey/common/constants/app_colors.dart';
import 'package:workeydockey/common/constants/app_gap.dart';
import 'package:workeydockey/common/constants/image_paths.dart';
import 'package:workeydockey/common/theme/app_theme.dart';

class RoleItemTile extends StatefulWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  const RoleItemTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<RoleItemTile> createState() => _RoleItemTileState();
}

class _RoleItemTileState extends State<RoleItemTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged?.call(!widget.isSelected),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: widget.isSelected == false
                          ? AppColors.grey300
                          : Colors.transparent,
                      width: 2),
                  color: widget.isSelected == false
                      ? Colors.transparent
                      : AppColors.brand600),
              child: widget.isSelected == false
                  ? null
                  : Image.asset(ImagePaths.checkIcon, width: 16, height: 16),
            ),
            Gap.size12,
            Text(widget.title, style: AppTextTheme.lg.regular),
          ],
        ),
      ),
    );
  }
}


