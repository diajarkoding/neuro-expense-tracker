import 'package:flutter/material.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_dimens.dart';
import '../../../../app/theme/neo_spacing.dart';
import '../../../../app/theme/neo_text_styles.dart';

class ExpenseCategoryOption {
  const ExpenseCategoryOption({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}

const expenseCategoryOptions = [
  ExpenseCategoryOption(
    name: 'Food',
    icon: Icons.restaurant_rounded,
    color: NeoColors.categoryFood,
  ),
  ExpenseCategoryOption(
    name: 'Transport',
    icon: Icons.directions_car_rounded,
    color: NeoColors.categoryTransport,
  ),
  ExpenseCategoryOption(
    name: 'Shopping',
    icon: Icons.shopping_bag_rounded,
    color: NeoColors.categoryShopping,
  ),
  ExpenseCategoryOption(
    name: 'Entertainment',
    icon: Icons.movie_rounded,
    color: NeoColors.categoryEntertainment,
  ),
  ExpenseCategoryOption(
    name: 'Bills',
    icon: Icons.receipt_rounded,
    color: NeoColors.categoryBills,
  ),
  ExpenseCategoryOption(
    name: 'Health',
    icon: Icons.favorite_rounded,
    color: NeoColors.categoryHealth,
  ),
  ExpenseCategoryOption(
    name: 'Education',
    icon: Icons.school_rounded,
    color: NeoColors.categoryEducation,
  ),
  ExpenseCategoryOption(
    name: 'Social',
    icon: Icons.groups_rounded,
    color: NeoColors.categorySocial,
  ),
  ExpenseCategoryOption(
    name: 'Gift',
    icon: Icons.card_giftcard_rounded,
    color: NeoColors.categoryGift,
  ),
  ExpenseCategoryOption(
    name: 'Daily Needs',
    icon: Icons.local_grocery_store_rounded,
    color: NeoColors.categoryDailyNeeds,
  ),
  ExpenseCategoryOption(
    name: 'Other',
    icon: Icons.inventory_2_rounded,
    color: NeoColors.categoryOther,
  ),
];

class ExpenseCategoryPicker extends StatelessWidget {
  const ExpenseCategoryPicker({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final ExpenseCategoryOption selectedCategory;
  final ValueChanged<ExpenseCategoryOption> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: NeoTextStyles.labelMedium),
        const SizedBox(height: NeoSpacing.sm),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: expenseCategoryOptions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: NeoSpacing.sm,
            mainAxisSpacing: NeoSpacing.sm,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            final category = expenseCategoryOptions[index];
            final selected = category.name == selectedCategory.name;
            return _CategoryTile(
              category: category,
              selected: selected,
              onTap: () => onChanged(category),
            );
          },
        ),
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final ExpenseCategoryOption category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(NeoDimens.cornerRadiusSmall),
        child: Container(
          decoration: BoxDecoration(
            color: selected ? category.color : NeoColors.pureWhite,
            borderRadius: BorderRadius.circular(NeoDimens.cornerRadiusSmall),
            border: Border.all(
              color: NeoColors.pureBlack,
              width: NeoDimens.borderWidth,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                color: selected ? NeoColors.pureWhite : NeoColors.pureBlack,
              ),
              const SizedBox(height: NeoSpacing.xs),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: NeoTextStyles.labelSmall.copyWith(
                  color: selected ? NeoColors.pureWhite : NeoColors.pureBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
