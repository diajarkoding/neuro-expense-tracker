import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/expenses/presentation/pages/add_expense_page.dart';
import '../../features/expenses/presentation/pages/expense_list_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/expenses',
      builder: (context, state) => const ExpenseListPage(),
    ),
    GoRoute(
      path: '/expenses/add',
      builder: (context, state) => const AddExpensePage(),
    ),
  ],
);
