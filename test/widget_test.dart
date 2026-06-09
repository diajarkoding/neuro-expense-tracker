// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive_ce.dart';

import 'package:neuro_expense_tracker/app/app.dart';
import 'package:neuro_expense_tracker/core/constants/hive_box_names.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/add_expense_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/edit_expense_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/expense_detail_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/expense_list_page.dart';

void main() {
  setUpAll(() {
    Hive.init('test_hive_box');
  });

  setUp(() async {
    final box = await Hive.openBox<Map>(HiveBoxNames.expenses);
    await box.clear();
  });

  tearDownAll(() async {
    await Hive.deleteBoxFromDisk(HiveBoxNames.expenses);
  });

  testWidgets('App renders splash screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: NeuroExpenseApp()));

    expect(find.text('NeuroExpense'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump();
  });

  testWidgets('Dashboard renders empty state when no expenses', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: ExpenseListPage())),
    );

    await _pumpAsync(tester);

    expect(find.text('No expenses yet.'), findsOneWidget);
  });

  testWidgets('Add expense page renders form', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: AddExpensePage())),
    );

    expect(find.text('Add Expense'), findsOneWidget);
    expect(find.text('Amount'), findsOneWidget);
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('SAVE EXPENSE'), findsOneWidget);
  });

  testWidgets('Expense detail page renders not found for missing id', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: ExpenseDetailPage(id: 'missing')),
      ),
    );

    await _pumpAsync(tester);

    expect(find.text('Expense not found.'), findsOneWidget);
  });

  testWidgets('Edit expense page renders not found for missing id', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: EditExpensePage(id: 'missing')),
      ),
    );

    await _pumpAsync(tester);

    expect(find.text('Expense not found.'), findsOneWidget);
  });
}

Future<void> _pumpAsync(WidgetTester tester) async {
  await tester.pump();
  await tester.runAsync(
    () => Future.delayed(const Duration(milliseconds: 100)),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump();
}
