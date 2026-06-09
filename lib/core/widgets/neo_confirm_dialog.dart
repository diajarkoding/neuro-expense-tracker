import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_text_styles.dart';

class NeoConfirmDialog extends StatelessWidget {
  const NeoConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.onConfirm,
    this.isDestructive = false,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final VoidCallback onConfirm;
  final bool isDestructive;

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmLabel,
    required VoidCallback onConfirm,
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => NeoConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        onConfirm: onConfirm,
        isDestructive: isDestructive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: NeoColors.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        side: const BorderSide(
          color: NeoColors.pureBlack,
          width: NeoDimens.borderWidth,
        ),
      ),
      title: Text(title, style: NeoTextStyles.titleMedium),
      content: Text(message, style: NeoTextStyles.bodyMedium),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text(
            'CANCEL',
            style: TextStyle(
              color: NeoColors.mediumGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pop(true);
            onConfirm();
          },
          child: Text(
            confirmLabel.toUpperCase(),
            style: TextStyle(
              color: isDestructive ? NeoColors.expenseRed : NeoColors.pureBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
