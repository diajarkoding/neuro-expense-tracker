import '../domain/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();

  Future<Expense?> getExpenseById(String id);

  Future<void> addExpense(Expense expense);

  Future<void> updateExpense(Expense expense);

  Future<void> deleteExpense(String id);
}
