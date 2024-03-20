import 'package:expenses/constants.dart';
import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
              style: kPlainTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: kPlainTextStyle,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      expense.formattedDate,
                      style: kPlainTextStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
