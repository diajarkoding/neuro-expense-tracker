import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/account_source.dart';
import '../domain/expense.dart';
import '../domain/expense_category.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String title,
    required double amount,
    required DateTime date,
    required ExpenseCategory category,
    required AccountSource accountSource,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}

extension ExpenseModelMapper on ExpenseModel {
  Expense toEntity() {
    return Expense(
      id: id,
      title: title,
      amount: amount,
      date: date,
      category: category,
      accountSource: accountSource,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ExpenseEntityMapper on Expense {
  ExpenseModel toModel() {
    return ExpenseModel(
      id: id,
      title: title,
      amount: amount,
      date: date,
      category: category,
      accountSource: accountSource,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
