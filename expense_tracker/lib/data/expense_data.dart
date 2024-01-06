import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  /// list of all expenses
  List<ExpenseItem> fullExpenseList = [];

  /// get expense list
  List<ExpenseItem> get getFullExpenseList => fullExpenseList;

  /// add new expense
  void addNewExpense(ExpenseItem expense) {
    fullExpenseList.add(expense);
    notifyListeners();
  }

  /// delete the expense
  void deleteExpense(ExpenseItem expense) {
    fullExpenseList.remove(expense);
  }

  // get the name of the week
  String getDayName(DateTime dateTime) {
    return [
      'Mon',
      'Tues',
      'Wed',
      'Thurs',
      'Fri',
      'Sat',
      'Sun'
    ][dateTime.day - 1];
  }

  /// get the date for the start of the week
}
