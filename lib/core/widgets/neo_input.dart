import 'package:flutter/material.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_spacing.dart';
import '../../app/theme/neo_text_styles.dart';

class NeoInput extends StatelessWidget {
  const NeoInput({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: NeoTextStyles.labelMedium),
        const SizedBox(height: NeoSpacing.sm),
        TextFormField(
          controller: controller,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          style: NeoTextStyles.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: NeoTextStyles.bodyMedium.copyWith(
              color: NeoColors.mediumGray,
            ),
            filled: true,
            fillColor: NeoColors.pureWhite,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: NeoSpacing.lg,
              vertical: NeoSpacing.md,
            ),
            border: _border(NeoColors.pureBlack),
            enabledBorder: _border(NeoColors.pureBlack),
            focusedBorder: _border(
              NeoColors.pureBlack,
              NeoDimens.borderWidthBold,
            ),
            errorBorder: _border(NeoColors.expenseRed),
            focusedErrorBorder: _border(
              NeoColors.expenseRed,
              NeoDimens.borderWidthBold,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(
    Color color, [
    double width = NeoDimens.borderWidth,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NeoDimens.cornerRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
