import 'package:flutter/material.dart';

class CustomToaster {
  static void showSuccess(BuildContext context, String message) {
    _showToast(context, message, Colors.green);
  }

  static void showWarning(BuildContext context, String message) {
    _showToast(context, message, Colors.orange);
  }

  static void _showToast(BuildContext context, String message, Color color) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
