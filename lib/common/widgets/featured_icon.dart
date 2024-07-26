import 'package:flutter/material.dart';

class FeaturedIcon extends StatelessWidget {
  String imagePaths;
  double size;
  Color backgroundColor;
  Color iconColor;
  Color borderColor;

  FeaturedIcon(
      {super.key,
      required this.imagePaths,
      required this.backgroundColor,
      required this.iconColor,
      this.borderColor = Colors.transparent,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      child: Image.asset(
        imagePaths,
        width: size,
        height: size,
        color: iconColor,
      ),
    );
  }
}
