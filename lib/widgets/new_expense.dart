import 'package:expenses/constants.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/models/expenses_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePecker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providedData = Provider.of<ExpensesData>(context, listen: true);

    void addExpense(Expense expense) {
      providedData.addExpense(expense);
    }

    void submitExpenseData() {
      final enteredAmount = double.tryParse(_amountController.text);
      final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
      if (_titleController.text.trim().isEmpty ||
          amountIsInvalid ||
          _selectedDate == null) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              'Invalid input',
            ),
            content: const Text(
              'Please recheck all values',
              style: kPlainTextStyle,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "OK",
                  style: kPlainTextStyle,
                ),
              ),
            ],
          ),
        );
        return;
      } else {
        addExpense(Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory,
        ));
        Navigator.pop(context);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title:'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount:'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select date"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePecker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        if (value == null) {
                          return;
                        }
                        _selectedCategory = value;
                      },
                    );
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: submitExpenseData,
                child: const Text('Add expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
