import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/expense.dart';
import 'expense_data_providers.dart';
import 'expense_form_input.dart';
import 'expense_form_state.dart';

part 'expense_form_provider.g.dart';

@riverpod
class ExpenseFormController extends _$ExpenseFormController {
  @override
  ExpenseFormState build() {
    return const ExpenseFormState();
  }

  Future<bool> addExpense(ExpenseFormInput input) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final now = DateTime.now();
      final expense = Expense(
        id: const Uuid().v4(),
        title: input.title.trim(),
        amount: input.amount,
        date: input.date,
        category: input.category,
        accountSource: input.accountSource,
        createdAt: now,
        updatedAt: now,
      );

      await ref.read(expenseRepositoryProvider).addExpense(expense);
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (_) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to save expense. Please try again.',
      );
      return false;
    }
  }

  Future<bool> updateExpense(Expense expense, ExpenseFormInput input) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final updatedExpense = Expense(
        id: expense.id,
        title: input.title.trim(),
        amount: input.amount,
        date: input.date,
        category: input.category,
        accountSource: input.accountSource,
        createdAt: expense.createdAt,
        updatedAt: DateTime.now(),
      );

      await ref.read(expenseRepositoryProvider).updateExpense(updatedExpense);
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (_) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to update expense. Please try again.',
      );
      return false;
    }
  }
}
