import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_card.dart';
import '../../../../core/widgets/neo_confirm_dialog.dart';
import '../../../../core/widgets/neo_snackbar.dart';

class ExpenseDetailPage extends StatelessWidget {
  const ExpenseDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeoColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            NeoSpacing.pageHorizontal,
            NeoSpacing.lg,
            NeoSpacing.pageHorizontal,
            NeoSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NeoIconActionButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: NeoSpacing.lg),
                  const Expanded(
                    child: Text(
                      'Expense Detail',
                      style: NeoTextStyles.titleLarge,
                    ),
                  ),
                  NeoIconActionButton(
                    icon: Icons.edit_rounded,
                    onPressed: () => context.push(RoutePaths.editExpense(id)),
                  ),
                ],
              ),
              const SizedBox(height: NeoSpacing.xxl),
              NeoCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expense', style: NeoTextStyles.labelMedium),
                    SizedBox(height: NeoSpacing.md),
                    Text('RM 125.50', style: NeoTextStyles.moneyLargeTextStyle),
                  ],
                ),
              ),
              const SizedBox(height: NeoSpacing.xl),
              NeoCardFlat(
                padding: const EdgeInsets.all(NeoSpacing.lg),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: NeoColors.categoryFood,
                        borderRadius: BorderRadius.circular(
                          NeoDimens.cornerRadiusSmall,
                        ),
                        border: Border.all(
                          color: NeoColors.pureBlack,
                          width: NeoDimens.borderWidth,
                        ),
                      ),
                      child: const Icon(
                        Icons.restaurant_rounded,
                        color: NeoColors.pureWhite,
                      ),
                    ),
                    const SizedBox(width: NeoSpacing.lg),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Category', style: NeoTextStyles.labelSmall),
                        const SizedBox(height: NeoSpacing.xs),
                        const Text('Food', style: NeoTextStyles.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: NeoSpacing.xl),
              NeoCardFlat(
                padding: const EdgeInsets.all(NeoSpacing.lg),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DetailRow(label: 'Title', value: 'Lunch at cafe'),
                    SizedBox(height: NeoSpacing.md),
                    _DetailRow(label: 'Date', value: '09 Jun 2026'),
                    SizedBox(height: NeoSpacing.md),
                    _DetailRow(label: 'Time', value: '12:30'),
                    SizedBox(height: NeoSpacing.md),
                    _DetailRow(label: 'Account', value: 'Cash'),
                  ],
                ),
              ),
              const SizedBox(height: NeoSpacing.xl),
              NeoButton(
                label: 'DELETE EXPENSE',
                backgroundColor: NeoColors.expenseRed,
                onPressed: () {
                  NeoConfirmDialog.show(
                    context: context,
                    title: 'Delete Expense',
                    message: 'Are you sure you want to delete this expense?',
                    confirmLabel: 'DELETE',
                    isDestructive: true,
                    onConfirm: () {
                      NeoSnackbar.success(
                        context,
                        'Expense deleted successfully.',
                      );
                      context.pop();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: NeoTextStyles.labelSmall),
        const SizedBox(height: NeoSpacing.xs),
        Text(value, style: NeoTextStyles.bodyMedium),
      ],
    );
  }
}
