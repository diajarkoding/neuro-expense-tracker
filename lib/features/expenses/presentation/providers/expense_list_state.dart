import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/expense.dart';

part 'expense_list_state.freezed.dart';

@freezed
class ExpenseListState with _$ExpenseListState {
  const factory ExpenseListState({
    @Default(false) bool isLoading,
    @Default([]) List<Expense> expenses,
    @Default(0) double totalExpense,
    String? errorMessage,
  }) = _ExpenseListState;
}
