import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../app/theme/neo_colors.dart';
import '../../app/theme/neo_dimens.dart';
import '../../app/theme/neo_spacing.dart';
import '../../app/theme/neo_text_styles.dart';

class _RinggitInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.isEmpty) {
      return const TextEditingValue();
    }

    final number = int.parse(text) / 100.0;
    final formatted = NumberFormat.currency(
      locale: 'en_MY',
      symbol: '',
      decimalDigits: 2,
    ).format(number);

    final offset = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}

class NeoCurrencyInput extends StatelessWidget {
  const NeoCurrencyInput({super.key, required this.controller, this.validator});

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amount', style: NeoTextStyles.labelMedium),
        const SizedBox(height: NeoSpacing.sm),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatters: [_RinggitInputFormatter()],
          style: NeoTextStyles.moneyTextStyle,
          decoration: InputDecoration(
            prefixText: 'RM ',
            prefixStyle: NeoTextStyles.moneyTextStyle,
            hintText: '0.00',
            hintStyle: NeoTextStyles.moneyTextStyle.copyWith(
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
