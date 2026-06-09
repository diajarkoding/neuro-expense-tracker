// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:neuro_expense_tracker/app/app.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/add_expense_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/edit_expense_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/expense_detail_page.dart';
import 'package:neuro_expense_tracker/features/expenses/presentation/pages/expense_list_page.dart';

void main() {
  testWidgets('App renders splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NeuroExpenseApp());

    expect(find.text('NeuroExpense'), findsOneWidget);

    await tester.pumpAndSettle();
  });

  testWidgets('Home page renders dashboard content', (tester) async {
    await tester.pumpWidget(_wrap(const ExpenseListPage()));

    expect(find.text('Good morning,'), findsOneWidget);
    expect(find.text('Total expenses'), findsOneWidget);
    expect(find.text('09 Jun 2026'), findsOneWidget);
    expect(find.text('08 Jun 2026'), findsOneWidget);
  });

  testWidgets('Add expense page renders form', (tester) async {
    await tester.pumpWidget(_wrap(const AddExpensePage()));

    expect(find.text('Add Expense'), findsOneWidget);
    expect(find.text('Amount'), findsOneWidget);
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('SAVE EXPENSE'), findsOneWidget);
  });

  testWidgets('Expense detail page renders detail content', (tester) async {
    await tester.pumpWidget(_wrap(const ExpenseDetailPage(id: '1')));

    expect(find.text('Expense Detail'), findsOneWidget);
    expect(find.text('RM 125.50'), findsOneWidget);
    expect(find.text('DELETE EXPENSE'), findsOneWidget);
  });

  testWidgets('Edit expense page renders prefilled form', (tester) async {
    await tester.pumpWidget(_wrap(const EditExpensePage(id: '1')));

    expect(find.text('Edit Expense'), findsOneWidget);
    expect(find.text('Lunch at cafe'), findsOneWidget);
    expect(find.text('UPDATE EXPENSE'), findsOneWidget);
  });
}

Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}
