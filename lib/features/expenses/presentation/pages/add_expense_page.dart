import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_snackbar.dart';
import '../widgets/expense_form.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeoColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            NeoSpacing.pageHorizontal,
            NeoSpacing.lg,
            NeoSpacing.pageHorizontal,
            NeoSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NeoIconActionButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: NeoSpacing.lg),
                  const Text('Add Expense', style: NeoTextStyles.titleLarge),
                ],
              ),
              const SizedBox(height: NeoSpacing.xxl),
              ExpenseForm(
                onSubmit: () {
                  NeoSnackbar.success(context, 'Expense added successfully.');
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
