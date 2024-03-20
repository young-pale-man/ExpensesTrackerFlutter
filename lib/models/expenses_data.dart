import 'package:flutter/foundation.dart';
import 'expense.dart';
import 'dart:collection';

class ExpensesData extends ChangeNotifier {
  final List<Expense> _registeredExpenses = [];

  UnmodifiableListView<Expense> get registeredExpenses {
    return UnmodifiableListView(_registeredExpenses);
  }

  void addExpense(Expense newExpense) {
    _registeredExpenses.add(newExpense);
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    _registeredExpenses.remove(expense);
    notifyListeners();
  }

  void insertExpense(int expenseIndex, Expense expense) {
    _registeredExpenses.insert(expenseIndex, expense);
    notifyListeners();
  }
}
