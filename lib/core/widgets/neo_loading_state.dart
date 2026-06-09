import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_spacing.dart';
import 'neo_card.dart';

class NeoLoadingState extends StatelessWidget {
  const NeoLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: NeoSpacing.lg),
        _skeleton(120, 20),
        const SizedBox(height: NeoSpacing.xl),
        NeoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _skeleton(100, 12),
              const SizedBox(height: NeoSpacing.md),
              _skeleton(140, 28),
              const SizedBox(height: NeoSpacing.sm),
              _skeleton(80, 12),
            ],
          ),
        ),
        const SizedBox(height: NeoSpacing.xxl),
        _skeleton(80, 12),
        const SizedBox(height: NeoSpacing.md),
        _skeletonCard(),
        const SizedBox(height: NeoSpacing.md),
        _skeletonCard(),
        const SizedBox(height: NeoSpacing.md),
        _skeletonCard(),
      ],
    );
  }

  Widget _skeleton(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: NeoColors.lightGray,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadiusSmall),
      ),
    );
  }

  Widget _skeletonCard() {
    return NeoCardFlat(
      padding: const EdgeInsets.all(NeoSpacing.md),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: NeoColors.lightGray,
              borderRadius: BorderRadius.circular(NeoDimens.cornerRadiusSmall),
            ),
          ),
          const SizedBox(width: NeoSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _skeleton(100, 14),
                const SizedBox(height: NeoSpacing.sm),
                _skeleton(140, 12),
              ],
            ),
          ),
          const SizedBox(width: NeoSpacing.md),
          _skeleton(70, 16),
        ],
      ),
    );
  }
}
