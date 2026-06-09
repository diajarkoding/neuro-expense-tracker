import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_spacing.dart';
import '../../app/theme/neo_text_styles.dart';
import 'neo_button.dart';
import 'neo_card.dart';

class NeoErrorState extends StatelessWidget {
  const NeoErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 40,
            color: NeoColors.expenseRed,
          ),
          const SizedBox(height: NeoSpacing.lg),
          Text(message, style: NeoTextStyles.titleMedium),
          const SizedBox(height: NeoSpacing.sm),
          const Text('Please try again.', style: NeoTextStyles.bodyMedium),
          const SizedBox(height: NeoSpacing.xl),
          NeoButton(
            label: 'RETRY',
            backgroundColor: NeoColors.pureBlack,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
