// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SoftButton extends StatelessWidget {
  Color backgroundColor;
  Color borderSideColor;
  Color disabledBackgroundColor;
  VoidCallback? onPressed;
  Widget child;
  double? width;
  SoftButton(
      {super.key,
      required this.backgroundColor,
      required this.onPressed,
      required this.child,
      this.disabledBackgroundColor = Colors.transparent,
      this.borderSideColor = Colors.transparent,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderSideColor),
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          overlayColor: Colors.transparent,
          elevation: 0,
        ),
        child: child,
      ),
    );
  }
}
