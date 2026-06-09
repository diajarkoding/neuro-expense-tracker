import 'package:flutter/material.dart';
import 'neo_colors.dart';
import 'neo_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: NeoColors.background,
      colorScheme: const ColorScheme.light(
        primary: NeoColors.pureBlack,
        onPrimary: NeoColors.pureWhite,
        surface: NeoColors.cardBackground,
        onSurface: NeoColors.pureBlack,
        error: NeoColors.expenseRed,
        onError: NeoColors.pureWhite,
      ),
      textTheme: const TextTheme(
        headlineLarge: NeoTextStyles.headlineLarge,
        headlineSmall: NeoTextStyles.headlineSmall,
        titleLarge: NeoTextStyles.titleLarge,
        titleMedium: NeoTextStyles.titleMedium,
        titleSmall: NeoTextStyles.titleSmall,
        bodyLarge: NeoTextStyles.bodyLarge,
        bodyMedium: NeoTextStyles.bodyMedium,
        bodySmall: NeoTextStyles.bodySmall,
        labelLarge: NeoTextStyles.labelLarge,
        labelMedium: NeoTextStyles.labelMedium,
        labelSmall: NeoTextStyles.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: NeoColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: NeoColors.pureBlack),
        titleTextStyle: NeoTextStyles.titleLarge,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NeoColors.pureBlack,
        foregroundColor: NeoColors.sunYellow,
      ),
    );
  }
}
