import 'package:expenses/chart/chart.dart';
import 'package:expenses/constants.dart';
import 'package:expenses/models/expenses_data.dart';
import 'package:expenses/widgets/expenses_list/expenses_list.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    final providedData = Provider.of<ExpensesData>(context, listen: true);

    const Widget emptyList = Center(
      child: Text(
        'No added expenses',
        style: kPlainTextStyle,
      ),
    );

    void openAddExpenseOverlay() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return const NewExpense();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Expense Tracker"),
            Icon(Icons.calculate_outlined),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: openAddExpenseOverlay,
        child: const Icon(
          Icons.create,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Chart(expenses: providedData.registeredExpenses),
          Expanded(
            child: providedData.registeredExpenses.isEmpty
                ? emptyList
                : const ExpensesList(),
          ),
        ],
      ),
    );
  }
}
