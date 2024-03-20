import 'package:expenses/constants.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/models/expenses_data.dart';
import 'package:expenses/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    final providedData = Provider.of<ExpensesData>(context, listen: true);

    void removeExpense(Expense expense) {
      final expenseIndex = providedData.registeredExpenses.indexOf(expense);

      providedData.removeExpense(expense);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: Text(
            'Expense Deleted',
            style: kPlainTextStyle.copyWith(color: Colors.white),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              providedData.insertExpense(expenseIndex, expense);
            },
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: providedData.registeredExpenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(providedData.registeredExpenses[index]),
        onDismissed: (direction) {
          removeExpense(providedData.registeredExpenses[index]);
        },
        child: ExpenseItem(
          expense: providedData.registeredExpenses[index],
        ),
      ),
    );
  }
}
