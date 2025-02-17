import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color backGroundColor = Colors.red,
  Duration duration = const Duration(seconds: 5),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backGroundColor,
      duration: duration,
    ),
  );
}
