import 'package:flutter/material.dart';

Future<void> bottomSheet(
    {required BuildContext context,
    required Widget child,
    required double height,
    required Color backgroundColor}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    barrierColor: Colors.black.withOpacity(0.75),
    isDismissible: true, // 밖의 영역 터치시 자동으로 창이 닫힘
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          padding: const EdgeInsets.all(2),
          child: child);
    },
  );
}
