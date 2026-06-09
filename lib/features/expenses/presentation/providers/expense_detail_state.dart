import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/expense.dart';

part 'expense_detail_state.freezed.dart';

@freezed
class ExpenseDetailState with _$ExpenseDetailState {
  const factory ExpenseDetailState({
    @Default(false) bool isLoading,
    Expense? expense,
    String? errorMessage,
    @Default(false) bool isDeleting,
  }) = _ExpenseDetailState;
}
