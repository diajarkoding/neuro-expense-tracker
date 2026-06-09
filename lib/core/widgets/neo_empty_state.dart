import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_spacing.dart';
import '../../app/theme/neo_text_styles.dart';
import 'neo_button.dart';
import 'neo_card.dart';

class NeoEmptyState extends StatelessWidget {
  const NeoEmptyState({super.key, required this.onAddExpense});

  final VoidCallback onAddExpense;

  @override
  Widget build(BuildContext context) {
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.receipt_long_rounded,
            size: 40,
            color: NeoColors.pureBlack,
          ),
          const SizedBox(height: NeoSpacing.lg),
          const Text('No expenses yet.', style: NeoTextStyles.titleMedium),
          const SizedBox(height: NeoSpacing.sm),
          const Text(
            'Start tracking your spending by adding your first expense.',
            style: NeoTextStyles.bodyMedium,
          ),
          const SizedBox(height: NeoSpacing.xl),
          NeoButton(label: 'ADD EXPENSE', onPressed: onAddExpense),
        ],
      ),
    );
  }
}
