import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_empty_state.dart';
import '../../../../core/widgets/neo_error_state.dart';
import '../../../../core/widgets/neo_loading_state.dart';
import '../../domain/expense.dart';
import '../providers/account_source_mapper.dart';
import '../providers/expense_category_mapper.dart';
import '../providers/expense_list_provider.dart';
import '../providers/expense_list_state.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_summary_card.dart';

class ExpenseListPage extends ConsumerStatefulWidget {
  const ExpenseListPage({super.key});

  @override
  ConsumerState<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends ConsumerState<ExpenseListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(expenseListControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expenseListControllerProvider);

    return Scaffold(
      backgroundColor: NeoColors.background,
      floatingActionButton: !state.isLoading && state.errorMessage == null
          ? NeoIconActionButton(
              icon: Icons.add_rounded,
              backgroundColor: NeoColors.pureBlack,
              foregroundColor: NeoColors.sunYellow,
              onPressed: () async {
                await context.push(RoutePaths.addExpense);
                ref.read(expenseListControllerProvider.notifier).refresh();
              },
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            NeoSpacing.pageHorizontal,
            NeoSpacing.lg,
            NeoSpacing.pageHorizontal,
            NeoSpacing.bottomWithFab,
          ),
          child: _buildContent(context, ref, state),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    ExpenseListState state,
  ) {
    if (state.isLoading) {
      return const SingleChildScrollView(child: NeoLoadingState());
    }

    if (state.errorMessage != null) {
      return Center(
        child: NeoErrorState(
          message: state.errorMessage!,
          onRetry: () =>
              ref.read(expenseListControllerProvider.notifier).refresh(),
        ),
      );
    }

    if (state.expenses.isEmpty) {
      return Center(
        child: NeoEmptyState(
          onAddExpense: () async {
            await context.push(RoutePaths.addExpense);
            ref.read(expenseListControllerProvider.notifier).refresh();
          },
        ),
      );
    }

    return _LoadedExpenseDashboard(
      expenses: state.expenses,
      totalExpense: state.totalExpense,
      onOpenExpense: (id) async {
        await context.push(RoutePaths.expenseDetail(id));
        ref.read(expenseListControllerProvider.notifier).refresh();
      },
    );
  }
}

class _LoadedExpenseDashboard extends StatelessWidget {
  const _LoadedExpenseDashboard({
    required this.expenses,
    required this.totalExpense,
    required this.onOpenExpense,
  });

  final List<Expense> expenses;
  final double totalExpense;
  final ValueChanged<String> onOpenExpense;

  @override
  Widget build(BuildContext context) {
    final groups = _groupExpenses(expenses);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const Text('Good morning,', style: NeoTextStyles.titleLarge),
            const SizedBox(height: NeoSpacing.xl),
            ExpenseSummaryCard(totalExpense: totalExpense),
            const SizedBox(height: NeoSpacing.xxl),
            ...groups.expand(
              (group) => [
                Text(group.dateLabel, style: NeoTextStyles.labelMedium),
                const SizedBox(height: NeoSpacing.md),
                ...group.expenses.expand((expense) {
                  final category = expense.category.toOption();
                  return [
                    ExpenseCard(
                      icon: category.icon,
                      title: expense.title,
                      metadata:
                          '${category.name} · ${AccountSourceMapper.toDisplayName(expense.accountSource)} · ${DateFormatter.time(expense.date)}',
                      amount: CurrencyFormatter.format(expense.amount),
                      color: category.color,
                      onTap: () => onOpenExpense(expense.id),
                    ),
                    const SizedBox(height: NeoSpacing.md),
                  ];
                }),
                const SizedBox(height: NeoSpacing.md),
              ],
            ),
          ]),
        ),
      ],
    );
  }

  List<_ExpenseGroup> _groupExpenses(List<Expense> expenses) {
    final groups = <String, List<Expense>>{};

    for (final expense in expenses) {
      final label = DateFormatter.shortDate(expense.date);
      groups.putIfAbsent(label, () => []).add(expense);
    }

    return groups.entries
        .map(
          (entry) => _ExpenseGroup(dateLabel: entry.key, expenses: entry.value),
        )
        .toList();
  }
}

class _ExpenseGroup {
  const _ExpenseGroup({required this.dateLabel, required this.expenses});

  final String dateLabel;
  final List<Expense> expenses;
}
