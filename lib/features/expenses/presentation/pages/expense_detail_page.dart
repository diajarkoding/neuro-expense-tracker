import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_card.dart';
import '../../../../core/widgets/neo_confirm_dialog.dart';
import '../../../../core/widgets/neo_error_state.dart';
import '../../../../core/widgets/neo_loading_state.dart';
import '../../../../core/widgets/neo_snackbar.dart';
import '../../domain/expense.dart';
import '../providers/account_source_mapper.dart';
import '../providers/expense_category_mapper.dart';
import '../providers/expense_detail_provider.dart';

class ExpenseDetailPage extends ConsumerStatefulWidget {
  const ExpenseDetailPage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ExpenseDetailPage> createState() => _ExpenseDetailPageState();
}

class _ExpenseDetailPageState extends ConsumerState<ExpenseDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(expenseDetailControllerProvider(widget.id).notifier)
          .loadExpense(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expenseDetailControllerProvider(widget.id));

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    onPressed: state.expense == null
                        ? null
                        : () => context.push(RoutePaths.editExpense(widget.id)),
                  ),
                ],
              ),
              const SizedBox(height: NeoSpacing.xxl),
              if (state.isLoading)
                const NeoLoadingState()
              else if (state.errorMessage != null)
                NeoErrorState(
                  message: state.errorMessage!,
                  onRetry: () => ref
                      .read(expenseDetailControllerProvider(widget.id).notifier)
                      .loadExpense(widget.id),
                )
              else if (state.expense case final expense?)
                _ExpenseDetailContent(
                  expense: expense,
                  isDeleting: state.isDeleting,
                  onDelete: () {
                    NeoConfirmDialog.show(
                      context: context,
                      title: 'Delete Expense',
                      message: 'Are you sure you want to delete this expense?',
                      confirmLabel: 'DELETE',
                      isDestructive: true,
                      onConfirm: () async {
                        final success = await ref
                            .read(
                              expenseDetailControllerProvider(
                                widget.id,
                              ).notifier,
                            )
                            .deleteExpense(widget.id);

                        if (!context.mounted) return;

                        if (success) {
                          NeoSnackbar.success(
                            context,
                            'Expense deleted successfully.',
                          );
                          context.pop();
                        } else {
                          NeoSnackbar.error(
                            context,
                            'Failed to delete expense. Please try again.',
                          );
                        }
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

class _ExpenseDetailContent extends StatelessWidget {
  const _ExpenseDetailContent({
    required this.expense,
    required this.isDeleting,
    required this.onDelete,
  });

  final Expense expense;
  final bool isDeleting;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final category = expense.category.toOption();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NeoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Expense', style: NeoTextStyles.labelMedium),
              const SizedBox(height: NeoSpacing.md),
              Text(
                CurrencyFormatter.format(expense.amount),
                style: NeoTextStyles.moneyLargeTextStyle,
              ),
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
                  color: category.color,
                  borderRadius: BorderRadius.circular(
                    NeoDimens.cornerRadiusSmall,
                  ),
                  border: Border.all(
                    color: NeoColors.pureBlack,
                    width: NeoDimens.borderWidth,
                  ),
                ),
                child: Icon(category.icon, color: NeoColors.pureWhite),
              ),
              const SizedBox(width: NeoSpacing.lg),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Category', style: NeoTextStyles.labelSmall),
                  const SizedBox(height: NeoSpacing.xs),
                  Text(category.name, style: NeoTextStyles.bodyMedium),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: NeoSpacing.xl),
        NeoCardFlat(
          padding: const EdgeInsets.all(NeoSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailRow(label: 'Title', value: expense.title),
              const SizedBox(height: NeoSpacing.md),
              _DetailRow(
                label: 'Date',
                value: DateFormatter.shortDate(expense.date),
              ),
              const SizedBox(height: NeoSpacing.md),
              _DetailRow(
                label: 'Time',
                value: DateFormatter.time(expense.date),
              ),
              const SizedBox(height: NeoSpacing.md),
              _DetailRow(
                label: 'Account',
                value: AccountSourceMapper.toDisplayName(expense.accountSource),
              ),
            ],
          ),
        ),
        const SizedBox(height: NeoSpacing.xl),
        NeoButton(
          label: isDeleting ? 'DELETING...' : 'DELETE EXPENSE',
          isLoading: isDeleting,
          backgroundColor: NeoColors.expenseRed,
          onPressed: onDelete,
        ),
      ],
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
