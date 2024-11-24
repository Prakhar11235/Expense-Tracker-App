import 'package:Kharcha/models/expense.dart';
import 'package:Kharcha/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });
  final void Function(Expense expense) onDismissed;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cnt, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        onDismissed: (direction) {
          onDismissed(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
