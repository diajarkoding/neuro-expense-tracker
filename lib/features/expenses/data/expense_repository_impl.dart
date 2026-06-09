import '../domain/expense.dart';
import 'expense_local_datasource.dart';
import 'expense_model.dart';
import 'expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  ExpenseRepositoryImpl({required this.localDataSource});

  final ExpenseLocalDataSource localDataSource;

  @override
  Future<List<Expense>> getExpenses() async {
    final models = await localDataSource.getExpenses();

    models.sort((a, b) {
      final dateComparison = b.date.compareTo(a.date);

      if (dateComparison != 0) {
        return dateComparison;
      }

      return b.createdAt.compareTo(a.createdAt);
    });

    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Expense?> getExpenseById(String id) async {
    final model = await localDataSource.getExpenseById(id);

    return model?.toEntity();
  }

  @override
  Future<void> addExpense(Expense expense) async {
    await localDataSource.addExpense(expense.toModel());
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    await localDataSource.updateExpense(expense.toModel());
  }

  @override
  Future<void> deleteExpense(String id) async {
    await localDataSource.deleteExpense(id);
  }
}
