// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  Color borderSideColor;
  VoidCallback? onPressed;
  Widget child;
  CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.onPressed,
      required this.child,
      this.borderSideColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderSideColor),
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: child,
      ),
    );
  }
}
