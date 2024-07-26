// lib/common/constants.dart
import 'package:flutter/material.dart';

class AppConst {
  static const double appBarBottomHeightFactor = 0.06;
  
  static double appBarBottomHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * appBarBottomHeightFactor;
  }
}
