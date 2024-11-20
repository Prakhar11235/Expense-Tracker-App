import 'package:Kharcha/models/expense.dart';
import 'package:Kharcha/widgets/expenses_list/expenses_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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