import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_text_styles.dart';

class NeoButton extends StatelessWidget {
  const NeoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = NeoColors.expenseRed,
    this.foregroundColor = NeoColors.pureWhite,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        boxShadow: isDisabled
            ? null
            : const [
                BoxShadow(
                  color: NeoColors.pureBlack,
                  offset: Offset(
                    NeoDimens.shadowOffsetSmallX,
                    NeoDimens.shadowOffsetSmallY,
                  ),
                  blurRadius: 0,
                ),
              ],
      ),
      child: SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: 52,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            disabledBackgroundColor: NeoColors.lightGray,
            disabledForegroundColor: NeoColors.mediumGray,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
              side: const BorderSide(
                color: NeoColors.pureBlack,
                width: NeoDimens.borderWidth,
              ),
            ),
            textStyle: NeoTextStyles.labelLarge,
          ),
          child: isLoading
              ? SizedBox(
                  width: NeoDimens.iconSizeSmall,
                  height: NeoDimens.iconSizeSmall,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: foregroundColor,
                  ),
                )
              : Text(label),
        ),
      ),
    );
  }
}

class NeoIconActionButton extends StatelessWidget {
  const NeoIconActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = NeoColors.cardBackground,
    this.foregroundColor = NeoColors.pureBlack,
    this.size = 52,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
        boxShadow: onPressed == null
            ? null
            : const [
                BoxShadow(
                  color: NeoColors.pureBlack,
                  offset: Offset(
                    NeoDimens.shadowOffsetSmallX,
                    NeoDimens.shadowOffsetSmallY,
                  ),
                  blurRadius: 0,
                ),
              ],
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: IconButton(
          onPressed: onPressed,
          style: IconButton.styleFrom(
            disabledBackgroundColor: NeoColors.lightGray,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            disabledForegroundColor: NeoColors.mediumGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
              side: const BorderSide(
                color: NeoColors.pureBlack,
                width: NeoDimens.borderWidth,
              ),
            ),
          ),
          icon: Icon(icon, size: NeoDimens.iconSizeMedium),
        ),
      ),
    );
  }
}
