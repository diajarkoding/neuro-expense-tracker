// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExpenseListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Expense> get expenses => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseListStateCopyWith<ExpenseListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseListStateCopyWith<$Res> {
  factory $ExpenseListStateCopyWith(
    ExpenseListState value,
    $Res Function(ExpenseListState) then,
  ) = _$ExpenseListStateCopyWithImpl<$Res, ExpenseListState>;
  @useResult
  $Res call({
    bool isLoading,
    List<Expense> expenses,
    double totalExpense,
    String? errorMessage,
  });
}

/// @nodoc
class _$ExpenseListStateCopyWithImpl<$Res, $Val extends ExpenseListState>
    implements $ExpenseListStateCopyWith<$Res> {
  _$ExpenseListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? expenses = null,
    Object? totalExpense = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            expenses: null == expenses
                ? _value.expenses
                : expenses // ignore: cast_nullable_to_non_nullable
                      as List<Expense>,
            totalExpense: null == totalExpense
                ? _value.totalExpense
                : totalExpense // ignore: cast_nullable_to_non_nullable
                      as double,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpenseListStateImplCopyWith<$Res>
    implements $ExpenseListStateCopyWith<$Res> {
  factory _$$ExpenseListStateImplCopyWith(
    _$ExpenseListStateImpl value,
    $Res Function(_$ExpenseListStateImpl) then,
  ) = __$$ExpenseListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<Expense> expenses,
    double totalExpense,
    String? errorMessage,
  });
}

/// @nodoc
class __$$ExpenseListStateImplCopyWithImpl<$Res>
    extends _$ExpenseListStateCopyWithImpl<$Res, _$ExpenseListStateImpl>
    implements _$$ExpenseListStateImplCopyWith<$Res> {
  __$$ExpenseListStateImplCopyWithImpl(
    _$ExpenseListStateImpl _value,
    $Res Function(_$ExpenseListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpenseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? expenses = null,
    Object? totalExpense = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ExpenseListStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        expenses: null == expenses
            ? _value._expenses
            : expenses // ignore: cast_nullable_to_non_nullable
                  as List<Expense>,
        totalExpense: null == totalExpense
            ? _value.totalExpense
            : totalExpense // ignore: cast_nullable_to_non_nullable
                  as double,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ExpenseListStateImpl implements _ExpenseListState {
  const _$ExpenseListStateImpl({
    this.isLoading = false,
    final List<Expense> expenses = const [],
    this.totalExpense = 0,
    this.errorMessage,
  }) : _expenses = expenses;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Expense> _expenses;
  @override
  @JsonKey()
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  @JsonKey()
  final double totalExpense;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ExpenseListState(isLoading: $isLoading, expenses: $expenses, totalExpense: $totalExpense, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_expenses),
    totalExpense,
    errorMessage,
  );

  /// Create a copy of ExpenseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseListStateImplCopyWith<_$ExpenseListStateImpl> get copyWith =>
      __$$ExpenseListStateImplCopyWithImpl<_$ExpenseListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ExpenseListState implements ExpenseListState {
  const factory _ExpenseListState({
    final bool isLoading,
    final List<Expense> expenses,
    final double totalExpense,
    final String? errorMessage,
  }) = _$ExpenseListStateImpl;

  @override
  bool get isLoading;
  @override
  List<Expense> get expenses;
  @override
  double get totalExpense;
  @override
  String? get errorMessage;

  /// Create a copy of ExpenseListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseListStateImplCopyWith<_$ExpenseListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
