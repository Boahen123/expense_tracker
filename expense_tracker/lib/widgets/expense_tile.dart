import 'package:expense_tracker/models/expense_item.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:expense_tracker/useful_functions/format_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      subtitle: Text(formatDateTime(expense.dateTime)),
      trailing: Consumer(
          builder: (context, ref, child) => Text(
              ref.watch(currencyProvider).currencySymbol + expense.amount)),
    );
  }
}
