import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_snackbar.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_summary_card.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = _dummyExpenses;

    return Scaffold(
      backgroundColor: NeoColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/expenses/add'),
        child: const Icon(Icons.add_rounded, size: NeoDimens.iconSizeLarge),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                NeoSpacing.pageHorizontal,
                NeoSpacing.lg,
                NeoSpacing.pageHorizontal,
                NeoSpacing.bottomWithFab,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text('Good morning,', style: NeoTextStyles.titleLarge),
                  const SizedBox(height: NeoSpacing.xl),
                  const ExpenseSummaryCard(),
                  const SizedBox(height: NeoSpacing.xxl),
                  const Text('09 Jun 2026', style: NeoTextStyles.labelMedium),
                  const SizedBox(height: NeoSpacing.md),
                  ...expenses.expand(
                    (expense) => [
                      ExpenseCard(
                        icon: expense.icon,
                        title: expense.title,
                        metadata: expense.metadata,
                        amount: expense.amount,
                        color: expense.color,
                        onTap: () => NeoSnackbar.info(
                          context,
                          '${expense.title} selected.',
                        ),
                      ),
                      const SizedBox(height: NeoSpacing.md),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DummyExpense {
  const _DummyExpense({
    required this.icon,
    required this.title,
    required this.metadata,
    required this.amount,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String metadata;
  final String amount;
  final Color color;
}

const _dummyExpenses = [
  _DummyExpense(
    icon: Icons.restaurant_rounded,
    title: 'Lunch',
    metadata: 'Food · Cash · 12:30',
    amount: 'RM 12.50',
    color: NeoColors.categoryFood,
  ),
  _DummyExpense(
    icon: Icons.directions_car_rounded,
    title: 'Ride to office',
    metadata: 'Transport · E-wallet · 08:15',
    amount: 'RM 18.00',
    color: NeoColors.categoryTransport,
  ),
  _DummyExpense(
    icon: Icons.receipt_rounded,
    title: 'Internet bill',
    metadata: 'Bills · Bank · 21:10',
    amount: 'RM 89.90',
    color: NeoColors.categoryBills,
  ),
];
