import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../core/widgets/neo_button.dart';
import '../../../../core/widgets/neo_currency_input.dart';
import '../../../../core/widgets/neo_date_picker_field.dart';
import '../../../../core/widgets/neo_input.dart';
import '../providers/account_source_mapper.dart';
import '../providers/expense_category_mapper.dart';
import '../providers/expense_form_input.dart';
import 'account_source_picker.dart';
import 'expense_category_picker.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key,
    required this.onSubmit,
    this.buttonLabel = 'SAVE EXPENSE',
    this.initialTitle,
    this.initialAmount,
    this.initialDate,
    this.initialCategoryName,
    this.initialAccountSource,
    this.isSubmitting = false,
  });

  final ValueChanged<ExpenseFormInput> onSubmit;
  final String buttonLabel;
  final String? initialTitle;
  final String? initialAmount;
  final DateTime? initialDate;
  final String? initialCategoryName;
  final String? initialAccountSource;
  final bool isSubmitting;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late DateTime selectedDate;
  late ExpenseCategoryOption selectedCategory;
  String selectedAccountSource = 'Cash';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    amountController = TextEditingController(text: widget.initialAmount);
    selectedDate = widget.initialDate ?? DateTime.now();
    if (widget.initialCategoryName case final name?) {
      selectedCategory = expenseCategoryOptions.firstWhere(
        (c) => c.name == name,
        orElse: () => expenseCategoryOptions.first,
      );
    } else {
      selectedCategory = expenseCategoryOptions.first;
    }
    selectedAccountSource = widget.initialAccountSource ?? 'Cash';
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NeoDatePickerField(
            value: DateFormat('dd MMM yyyy').format(selectedDate),
            onTap: _pickDate,
          ),
          const SizedBox(height: NeoSpacing.xl),
          NeoCurrencyInput(
            controller: amountController,
            validator: _validateAmount,
          ),
          const SizedBox(height: NeoSpacing.xl),
          ExpenseCategoryPicker(
            selectedCategory: selectedCategory,
            onChanged: (category) {
              setState(() => selectedCategory = category);
            },
          ),
          const SizedBox(height: NeoSpacing.xl),
          AccountSourcePicker(
            selectedSource: selectedAccountSource,
            onChanged: (source) {
              setState(() => selectedAccountSource = source);
            },
          ),
          const SizedBox(height: NeoSpacing.xl),
          NeoInput(
            label: 'Title',
            hintText: 'Enter expense title',
            controller: titleController,
            textInputAction: TextInputAction.done,
            validator: _validateTitle,
          ),
          const SizedBox(height: NeoSpacing.xxl),
          NeoButton(
            label: widget.isSubmitting ? 'SAVING...' : widget.buttonLabel,
            isLoading: widget.isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && mounted) {
      setState(() => selectedDate = pickedDate);
    }
  }

  void _submit() {
    if (formKey.currentState?.validate() ?? false) {
      widget.onSubmit(
        ExpenseFormInput(
          title: titleController.text.trim(),
          amount: _parseAmount(amountController.text),
          date: selectedDate,
          category: selectedCategory.toDomain(),
          accountSource: AccountSourceMapper.fromDisplayName(
            selectedAccountSource,
          ),
        ),
      );
    }
  }

  double _parseAmount(String value) {
    return double.parse(value.trim().replaceAll(',', ''));
  }

  String? _validateTitle(String? value) {
    final title = value?.trim() ?? '';

    if (title.isEmpty) {
      return 'Title is required.';
    }

    if (title.length < 2) {
      return 'Title must be at least 2 characters.';
    }

    return null;
  }

  String? _validateAmount(String? value) {
    final raw = value?.trim().replaceAll(',', '') ?? '';

    if (raw.isEmpty) {
      return 'Amount is required.';
    }

    final amount = double.tryParse(raw);

    if (amount == null) {
      return 'Amount must be a valid number.';
    }

    if (amount <= 0) {
      return 'Amount must be greater than 0.';
    }

    return null;
  }
}
