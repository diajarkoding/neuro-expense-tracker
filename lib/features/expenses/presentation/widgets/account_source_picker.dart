import 'package:flutter/material.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';

class AccountSourcePicker extends StatelessWidget {
  const AccountSourcePicker({
    super.key,
    required this.selectedSource,
    required this.onChanged,
  });

  final String selectedSource;
  final ValueChanged<String> onChanged;

  static const sources = ['Cash', 'Bank', 'E-wallet'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Account', style: NeoTextStyles.labelMedium),
        const SizedBox(height: NeoSpacing.sm),
        Row(
          children: sources.map((source) {
            final selected = selectedSource == source;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: source == sources.last ? 0 : NeoSpacing.sm,
                ),
                child: _AccountTile(
                  label: source,
                  selected: selected,
                  onTap: () => onChanged(source),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? NeoColors.pureBlack : NeoColors.cardBackground,
            borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
            border: Border.all(
              color: NeoColors.pureBlack,
              width: NeoDimens.borderWidth,
            ),
          ),
          child: Text(
            label.toUpperCase(),
            style: NeoTextStyles.labelSmall.copyWith(
              color: selected ? NeoColors.pureWhite : NeoColors.pureBlack,
            ),
          ),
        ),
      ),
    );
  }
}
