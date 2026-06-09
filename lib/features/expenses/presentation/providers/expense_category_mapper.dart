import '../../domain/expense_category.dart';
import '../widgets/expense_category_picker.dart';

extension ExpenseCategoryUIMapper on ExpenseCategory {
  ExpenseCategoryOption toOption() {
    return expenseCategoryOptions.firstWhere(
      (option) => option.name == name.toCategoryDisplayName,
    );
  }
}

extension ExpenseCategoryDomainMapper on ExpenseCategoryOption {
  ExpenseCategory toDomain() {
    return ExpenseCategory.values.firstWhere(
      (category) => category.name.toCategoryDisplayName == name,
    );
  }
}

extension on String {
  String get toCategoryDisplayName {
    return switch (this) {
      'food' => 'Food',
      'transport' => 'Transport',
      'shopping' => 'Shopping',
      'entertainment' => 'Entertainment',
      'bills' => 'Bills',
      'health' => 'Health',
      'education' => 'Education',
      'social' => 'Social',
      'gift' => 'Gift',
      'dailyNeeds' => 'Daily Needs',
      'other' => 'Other',
      _ => 'Other',
    };
  }
}
