import 'package:expense_tracker/models/expense_item.dart';
import 'package:expense_tracker/useful_functions/format_date.dart';
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
  DateTime? startOfWeekDate() {
    DateTime? startOfWeek;

    // get todays date
    DateTime today = DateTime.now();

    // go backwards from today to locate sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek;
  }

  // Compute the Daily Expense Summary
  Map<String, double> computeDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // date : amountTotalForTheDay
    };

    for (ExpenseItem expense in fullExpenseList) {
      String date = formatDate(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double totalAmount = dailyExpenseSummary[date]!;
        totalAmount += amount;
        dailyExpenseSummary[date] = totalAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}
