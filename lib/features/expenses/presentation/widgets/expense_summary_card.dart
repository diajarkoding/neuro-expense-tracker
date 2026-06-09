import 'package:flutter/material.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/neo_card.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({super.key, required this.totalExpense});

  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormatter.monthYear(DateTime.now()),
                style: NeoTextStyles.labelMedium,
              ),
              const _ExpenseBadge(),
            ],
          ),
          const SizedBox(height: NeoSpacing.xl),
          Text(
            CurrencyFormatter.format(totalExpense),
            style: NeoTextStyles.moneyLargeTextStyle,
          ),
          const SizedBox(height: NeoSpacing.xs),
          const Text('Total expenses', style: NeoTextStyles.bodySmall),
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
