import 'package:Kharcha/models/expense.dart';
import 'package:Kharcha/widgets/expenses_list/expenses_list.dart';
import 'package:Kharcha/widgets/new_expense.dart';

import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 399,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Netflix',
      amount: 149,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _openAddExpenseSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addNewExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kharcha"),
          actions: [
            IconButton(
              onPressed: _openAddExpenseSheet,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text('chart'),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ));
  }
}
