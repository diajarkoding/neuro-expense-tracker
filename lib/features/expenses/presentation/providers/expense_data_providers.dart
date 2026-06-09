import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/hive_box_names.dart';
import '../../data/expense_local_datasource.dart';
import '../../data/expense_local_datasource_impl.dart';
import '../../data/expense_repository.dart';
import '../../data/expense_repository_impl.dart';

part 'expense_data_providers.g.dart';

@Riverpod(keepAlive: true)
Box<Map> expenseBox(Ref ref) {
  return Hive.box<Map>(HiveBoxNames.expenses);
}

@Riverpod(keepAlive: true)
ExpenseLocalDataSource expenseLocalDataSource(Ref ref) {
  return ExpenseLocalDataSourceImpl(box: ref.watch(expenseBoxProvider));
}

@Riverpod(keepAlive: true)
ExpenseRepository expenseRepository(Ref ref) {
  return ExpenseRepositoryImpl(
    localDataSource: ref.watch(expenseLocalDataSourceProvider),
  );
}
