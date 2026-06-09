import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_form_state.freezed.dart';

@freezed
class ExpenseFormState with _$ExpenseFormState {
  const factory ExpenseFormState({
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _ExpenseFormState;
}
