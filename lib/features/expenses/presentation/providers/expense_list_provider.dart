import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'expense_data_providers.dart';
import 'expense_list_state.dart';

part 'expense_list_provider.g.dart';

@riverpod
class ExpenseListController extends _$ExpenseListController {
  @override
  ExpenseListState build() {
    Future.microtask(loadExpenses);
    return const ExpenseListState(isLoading: true);
  }

  Future<void> loadExpenses() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final expenses = await ref.read(expenseRepositoryProvider).getExpenses();
      final totalExpense = expenses.fold<double>(
        0,
        (sum, expense) => sum + expense.amount,
      );

      state = state.copyWith(
        isLoading: false,
        expenses: expenses,
        totalExpense: totalExpense,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load expenses.',
      );
    }
  }

  Future<void> refresh() async {
    await loadExpenses();
  }
}
