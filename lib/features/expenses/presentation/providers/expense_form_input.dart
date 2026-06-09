import '../../domain/account_source.dart';
import '../../domain/expense_category.dart';

class ExpenseFormInput {
  const ExpenseFormInput({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.accountSource,
  });

  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final AccountSource accountSource;
}
