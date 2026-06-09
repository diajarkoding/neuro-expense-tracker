import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class NeuroExpenseApp extends StatelessWidget {
  const NeuroExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NeuroExpense Tracker',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
