import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final ExpenseItem expense;
  const ExpenseTile({
    super.key,
    required this.expense, 
  });



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(expense.name),
      subtitle: Text(expense.dateTime.toString()),
      trailing: Text(expense.amount),
    );
  }
}