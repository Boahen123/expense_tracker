import 'package:expense_tracker/data/bar_graph/bar_graph.dart';
import 'package:expense_tracker/providers/expense_data_provider.dart';
import 'package:expense_tracker/useful_functions/format_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    /// Get the YYYY-MM-DD for each day of the week
    String sunday = formatDate(startOfWeek.add(const Duration(days: 0)));
    String monday = formatDate(startOfWeek.add(const Duration(days: 1)));
    String tuesday = formatDate(startOfWeek.add(const Duration(days: 2)));
    String wednesday = formatDate(startOfWeek.add(const Duration(days: 3)));
    String thursday = formatDate(startOfWeek.add(const Duration(days: 4)));
    String friday = formatDate(startOfWeek.add(const Duration(days: 5)));
    String saturday = formatDate(startOfWeek.add(const Duration(days: 6)));

    return Consumer(builder: (context, ref, child) {
      var value = ref.watch(expenseDataProvider);
      return SizedBox(
        height: 200,
        child: BarGraph(
          maxY: 100,
          sun: value.computeDailyExpenseSummary()[sunday] ?? 0,
          mon: value.computeDailyExpenseSummary()[monday] ?? 0,
          tue: value.computeDailyExpenseSummary()[tuesday] ?? 0,
          wed: value.computeDailyExpenseSummary()[wednesday] ?? 0,
          thurs: value.computeDailyExpenseSummary()[thursday] ?? 0,
          fri: value.computeDailyExpenseSummary()[friday] ?? 0,
          sat: value.computeDailyExpenseSummary()[saturday] ?? 0,
        ),
      );
    });
  }
}
