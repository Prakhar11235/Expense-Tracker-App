import 'package:Kharcha/models/expense.dart';
import 'package:Kharcha/widgets/Chart/chart.dart';
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

  void removeExpense(Expense expense) {
    final removedIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(removedIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addNewExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Expense log is empty. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDismissed: removeExpense,
      );
    }
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
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContent,
            ),
          ],
        ));
  }
}
