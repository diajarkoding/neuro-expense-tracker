import 'package:flutter/material.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_card.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('June 2026', style: NeoTextStyles.labelMedium),
              _ExpenseBadge(),
            ],
          ),
          SizedBox(height: NeoSpacing.xl),
          Text('RM 1,250.75', style: NeoTextStyles.moneyLargeTextStyle),
          SizedBox(height: NeoSpacing.xs),
          Text('Total expenses', style: NeoTextStyles.bodySmall),
        ],
      ),
    );
  }
}

class _ExpenseBadge extends StatelessWidget {
  const _ExpenseBadge();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: NeoColors.sunYellow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: NeoColors.pureBlack, width: 2),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: NeoSpacing.sm, vertical: 4),
        child: Text('Expense', style: NeoTextStyles.labelSmall),
      ),
    );
  }
}
