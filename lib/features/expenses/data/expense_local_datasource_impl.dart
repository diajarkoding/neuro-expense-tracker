import 'package:hive_ce/hive_ce.dart';
import 'expense_local_datasource.dart';
import 'expense_model.dart';

class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  ExpenseLocalDataSourceImpl({required this.box});

  final Box<Map> box;

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    return box.values.map((map) {
      return ExpenseModel.fromJson(Map<String, dynamic>.from(map));
    }).toList();
  }

  @override
  Future<ExpenseModel?> getExpenseById(String id) async {
    final map = box.get(id);

    if (map == null) {
      return null;
    }

    return ExpenseModel.fromJson(Map<String, dynamic>.from(map));
  }

  @override
  Future<void> addExpense(ExpenseModel expense) async {
    await box.put(expense.id, expense.toJson());
  }

  @override
  Future<void> updateExpense(ExpenseModel expense) async {
    await box.put(expense.id, expense.toJson());
  }

  @override
  Future<void> deleteExpense(String id) async {
    await box.delete(id);
  }
}
