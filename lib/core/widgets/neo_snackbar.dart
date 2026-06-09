import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_text_styles.dart';

class NeoSnackbar {
  NeoSnackbar._();

  static void success(BuildContext context, String message) {
    _show(context, message, NeoColors.successGreen);
  }

  static void error(BuildContext context, String message) {
    _show(context, message, NeoColors.expenseRed);
  }

  static void info(BuildContext context, String message) {
    _show(context, message, NeoColors.infoBlue);
  }

  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: NeoTextStyles.bodyMedium.copyWith(color: NeoColors.pureWhite),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
