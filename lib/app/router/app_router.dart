import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/expenses/presentation/pages/add_expense_page.dart';
import '../../features/expenses/presentation/pages/edit_expense_page.dart';
import '../../features/expenses/presentation/pages/expense_detail_page.dart';
import '../../features/expenses/presentation/pages/expense_list_page.dart';
import 'route_paths.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePaths.expenses,
      builder: (context, state) => const ExpenseListPage(),
    ),
    GoRoute(
      path: RoutePaths.addExpense,
      builder: (context, state) => const AddExpensePage(),
    ),
    GoRoute(
      path: RoutePaths.expenseDetailPattern,
      builder: (context, state) =>
          ExpenseDetailPage(id: state.pathParameters['id'] ?? ''),
    ),
    GoRoute(
      path: RoutePaths.editExpensePattern,
      builder: (context, state) =>
          EditExpensePage(id: state.pathParameters['id'] ?? ''),
    ),
  ],
);
