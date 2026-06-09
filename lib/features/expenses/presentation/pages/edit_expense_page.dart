import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_error_state.dart';
import '../../../../core/widgets/neo_loading_state.dart';
import '../../../../core/widgets/neo_snackbar.dart';
import '../providers/account_source_mapper.dart';
import '../providers/expense_category_mapper.dart';
import '../providers/expense_detail_provider.dart';
import '../providers/expense_form_provider.dart';
import '../widgets/expense_form.dart';

class EditExpensePage extends ConsumerStatefulWidget {
  const EditExpensePage({super.key, required this.id});

  final String id;

  @override
  ConsumerState<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends ConsumerState<EditExpensePage> {
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
    final detailState = ref.watch(expenseDetailControllerProvider(widget.id));
    final formState = ref.watch(expenseFormControllerProvider);

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
                  const Text('Edit Expense', style: NeoTextStyles.titleLarge),
                ],
              ),
              const SizedBox(height: NeoSpacing.xxl),
              if (detailState.isLoading)
                const NeoLoadingState()
              else if (detailState.errorMessage != null)
                NeoErrorState(
                  message: detailState.errorMessage!,
                  onRetry: () => ref
                      .read(expenseDetailControllerProvider(widget.id).notifier)
                      .loadExpense(widget.id),
                )
              else if (detailState.expense case final expense?)
                ExpenseForm(
                  buttonLabel: 'UPDATE EXPENSE',
                  isSubmitting: formState.isSubmitting,
                  initialTitle: expense.title,
                  initialAmount: CurrencyFormatter.format(
                    expense.amount,
                  ).replaceAll('RM ', ''),
                  initialDate: expense.date,
                  initialCategoryName: expense.category.toOption().name,
                  initialAccountSource: AccountSourceMapper.toDisplayName(
                    expense.accountSource,
                  ),
                  onSubmit: (input) async {
                    final success = await ref
                        .read(expenseFormControllerProvider.notifier)
                        .updateExpense(expense, input);

                    if (!context.mounted) return;

                    if (success) {
                      NeoSnackbar.success(
                        context,
                        'Expense updated successfully.',
                      );
                      context.pop();
                    } else {
                      NeoSnackbar.error(
                        context,
                        'Failed to update expense. Please try again.',
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
