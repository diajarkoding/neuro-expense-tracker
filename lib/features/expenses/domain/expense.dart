import 'account_source.dart';
import 'expense_category.dart';

class Expense {
  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.accountSource,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final AccountSource accountSource;
  final DateTime createdAt;
  final DateTime updatedAt;
}
