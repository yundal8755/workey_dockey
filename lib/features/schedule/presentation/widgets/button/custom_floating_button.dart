import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String icon;
  const CustomFloatingButton(
      {super.key,
      required this.onPressed,
      required this.backgroundColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          shape: const CircleBorder(),
          child: Image.asset(icon, width: 24, height: 24,)
        ),
      ),
    );
  }
}
