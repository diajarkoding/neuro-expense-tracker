import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_spacing.dart';

class NeoCard extends StatelessWidget {
  const NeoCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(NeoSpacing.lg),
    this.backgroundColor = NeoColors.cardBackground,
    this.shadowOffset = const Offset(
      NeoDimens.shadowOffsetSmallX,
      NeoDimens.shadowOffsetSmallY,
    ),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        border: Border.all(
          color: NeoColors.pureBlack,
          width: NeoDimens.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: NeoColors.pureBlack,
            offset: shadowOffset,
            blurRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class NeoCardFlat extends StatelessWidget {
  const NeoCardFlat({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(NeoSpacing.md),
    this.backgroundColor = NeoColors.cardBackground,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        border: Border.all(
          color: NeoColors.pureBlack,
          width: NeoDimens.borderWidth,
        ),
      ),
      child: child,
    );

    if (onTap == null) {
      return card;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        child: card,
      ),
    );
  }
}
