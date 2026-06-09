import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_spacing.dart';
import '../../app/theme/neo_text_styles.dart';
import 'neo_card.dart';

class NeoDatePickerField extends StatelessWidget {
  const NeoDatePickerField({
    super.key,
    required this.value,
    required this.onTap,
  });

  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Date', style: NeoTextStyles.labelMedium),
        const SizedBox(height: NeoSpacing.sm),
        NeoCardFlat(
          onTap: onTap,
          padding: const EdgeInsets.symmetric(
            horizontal: NeoSpacing.lg,
            vertical: NeoSpacing.md,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: NeoColors.pureBlack,
              ),
              const SizedBox(width: NeoSpacing.md),
              Text(value, style: NeoTextStyles.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
