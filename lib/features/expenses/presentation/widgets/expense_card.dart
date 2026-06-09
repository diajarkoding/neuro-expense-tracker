import 'package:flutter/material.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_card.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.icon,
    required this.title,
    required this.metadata,
    required this.amount,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String metadata;
  final String amount;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return NeoCardFlat(
      onTap: onTap,
      padding: const EdgeInsets.all(NeoSpacing.md),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(NeoDimens.cornerRadiusSmall),
              border: Border.all(
                color: NeoColors.pureBlack,
                width: NeoDimens.borderWidth,
              ),
            ),
            child: Icon(icon, color: NeoColors.pureWhite, size: 22),
          ),
          const SizedBox(width: NeoSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: NeoTextStyles.bodyMedium),
                const SizedBox(height: NeoSpacing.xs),
                Text(metadata, style: NeoTextStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: NeoSpacing.md),
          Text(amount, style: NeoTextStyles.titleSmall),
        ],
      ),
    );
  }
}
