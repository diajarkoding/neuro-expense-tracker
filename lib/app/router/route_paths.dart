class RoutePaths {
  RoutePaths._();

  static const splash = '/splash';
  static const expenses = '/expenses';
  static const addExpense = '/expenses/add';
  static const expenseDetailPattern = '/expenses/:id';
  static const editExpensePattern = '/expenses/:id/edit';

  static String expenseDetail(String id) => '/expenses/$id';
  static String editExpense(String id) => '/expenses/$id/edit';
}
