import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_empty_state.dart';
import '../../../../core/widgets/neo_error_state.dart';
import '../../../../core/widgets/neo_loading_state.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_summary_card.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  var status = _ExpenseHomeStatus.loaded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeoColors.background,
      floatingActionButton: status == _ExpenseHomeStatus.loaded
          ? NeoIconActionButton(
              icon: Icons.add_rounded,
              backgroundColor: NeoColors.pureBlack,
              foregroundColor: NeoColors.sunYellow,
              onPressed: () => context.push(RoutePaths.addExpense),
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
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return switch (status) {
      _ExpenseHomeStatus.loading => const SingleChildScrollView(
        child: NeoLoadingState(),
      ),
      _ExpenseHomeStatus.error => Center(
        child: NeoErrorState(
          message: 'Failed to load expenses.',
          onRetry: () => setState(() => status = _ExpenseHomeStatus.loaded),
        ),
      ),
      _ExpenseHomeStatus.empty => Center(
        child: NeoEmptyState(
          onAddExpense: () => context.push(RoutePaths.addExpense),
        ),
      ),
      _ExpenseHomeStatus.loaded => _LoadedExpenseDashboard(
        onOpenExpense: (id) => context.push(RoutePaths.expenseDetail(id)),
      ),
    };
  }
}

class _LoadedExpenseDashboard extends StatelessWidget {
  const _LoadedExpenseDashboard({required this.onOpenExpense});

  final ValueChanged<String> onOpenExpense;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const Text('Good morning,', style: NeoTextStyles.titleLarge),
            const SizedBox(height: NeoSpacing.xl),
            const ExpenseSummaryCard(),
            const SizedBox(height: NeoSpacing.xxl),
            ..._expenseGroups.expand(
              (group) => [
                Text(group.dateLabel, style: NeoTextStyles.labelMedium),
                const SizedBox(height: NeoSpacing.md),
                ...group.expenses.expand(
                  (expense) => [
                    ExpenseCard(
                      icon: expense.icon,
                      title: expense.title,
                      metadata: expense.metadata,
                      amount: expense.amount,
                      color: expense.color,
                      onTap: () => onOpenExpense(expense.id),
                    ),
                    const SizedBox(height: NeoSpacing.md),
                  ],
                ),
                const SizedBox(height: NeoSpacing.md),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}

class _DummyExpenseGroup {
  const _DummyExpenseGroup({required this.dateLabel, required this.expenses});

  final String dateLabel;
  final List<_DummyExpense> expenses;
}

class _DummyExpense {
  const _DummyExpense({
    required this.id,
    required this.icon,
    required this.title,
    required this.metadata,
    required this.amount,
    required this.color,
  });

  final String id;
  final IconData icon;
  final String title;
  final String metadata;
  final String amount;
  final Color color;
}

enum _ExpenseHomeStatus { loading, error, empty, loaded }

const _expenseGroups = [
  _DummyExpenseGroup(
    dateLabel: '09 Jun 2026',
    expenses: [
      _DummyExpense(
        id: '1',
        icon: Icons.restaurant_rounded,
        title: 'Lunch',
        metadata: 'Food · Cash · 12:30',
        amount: 'RM 12.50',
        color: NeoColors.categoryFood,
      ),
      _DummyExpense(
        id: '2',
        icon: Icons.directions_car_rounded,
        title: 'Ride to office',
        metadata: 'Transport · E-wallet · 08:15',
        amount: 'RM 18.00',
        color: NeoColors.categoryTransport,
      ),
    ],
  ),
  _DummyExpenseGroup(
    dateLabel: '08 Jun 2026',
    expenses: [
      _DummyExpense(
        id: '3',
        icon: Icons.receipt_rounded,
        title: 'Internet bill',
        metadata: 'Bills · Bank · 21:10',
        amount: 'RM 89.90',
        color: NeoColors.categoryBills,
      ),
    ],
  ),
];
