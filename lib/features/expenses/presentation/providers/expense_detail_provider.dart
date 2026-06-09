import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'expense_data_providers.dart';
import 'expense_detail_state.dart';

part 'expense_detail_provider.g.dart';

@riverpod
class ExpenseDetailController extends _$ExpenseDetailController {
  @override
  ExpenseDetailState build(String id) {
    return const ExpenseDetailState();
  }

  Future<void> loadExpense(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final expense = await ref
          .read(expenseRepositoryProvider)
          .getExpenseById(id);

      if (expense == null) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Expense not found.',
        );
        return;
      }

      state = state.copyWith(isLoading: false, expense: expense);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load expenses. Please try again.',
      );
    }
  }

  Future<bool> deleteExpense(String id) async {
    state = state.copyWith(isDeleting: true, errorMessage: null);

    try {
      await ref.read(expenseRepositoryProvider).deleteExpense(id);
      state = state.copyWith(isDeleting: false);
      return true;
    } catch (_) {
      state = state.copyWith(
        isDeleting: false,
        errorMessage: 'Failed to delete expense. Please try again.',
      );
      return false;
    }
  }
}
