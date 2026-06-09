// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: $enumDecode(_$ExpenseCategoryEnumMap, json['category']),
      accountSource: $enumDecode(_$AccountSourceEnumMap, json['accountSource']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'category': _$ExpenseCategoryEnumMap[instance.category]!,
      'accountSource': _$AccountSourceEnumMap[instance.accountSource]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.food: 'food',
  ExpenseCategory.transport: 'transport',
  ExpenseCategory.shopping: 'shopping',
  ExpenseCategory.entertainment: 'entertainment',
  ExpenseCategory.bills: 'bills',
  ExpenseCategory.health: 'health',
  ExpenseCategory.education: 'education',
  ExpenseCategory.social: 'social',
  ExpenseCategory.gift: 'gift',
  ExpenseCategory.dailyNeeds: 'dailyNeeds',
  ExpenseCategory.other: 'other',
};

const _$AccountSourceEnumMap = {
  AccountSource.cash: 'cash',
  AccountSource.bank: 'bank',
  AccountSource.eWallet: 'eWallet',
};
