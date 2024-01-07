import 'package:expense_tracker/models/expense_item.dart';
import 'package:expense_tracker/providers/expense_data_provider.dart';
import 'package:expense_tracker/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExpenseScreen extends ConsumerWidget {
  AddExpenseScreen({super.key});

  // text controllers
  final TextEditingController expenseName = TextEditingController();
  final TextEditingController expenseAmount = TextEditingController();

  /// The function "clear" clears the expenseAmount and expenseName controllers.
  void clear() {
    expenseAmount.clear();
    expenseName.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The `save()` function creates a new `ExpenseItem` object with user input, adds it to a data
    /// provider, closes the current screen, and clears the input fields.
    void save() {
      ExpenseItem newExpense = ExpenseItem(
          name: expenseName.text,
          amount: expenseAmount.text,
          dateTime: DateTime.now());
      ref.watch(expenseDataProvider).addNewExpense(newExpense);
      Navigator.pop(context);
      clear();
    }

    /// The function cancels the opened dialog
    void cancel() {
      Navigator.pop(context);
      clear();
    }

    /// The `addExpense` function displays an AlertDialog with text fields for entering the name and
    /// amount of an expense, along with buttons to save or cancel the entry.
    void addExpense() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Add new expense'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: expenseName,
                    ),
                    TextField(
                      controller: expenseAmount,
                    )
                  ],
                ),
                actions: [
                  ElevatedButton(onPressed: save, child: const Text('Save')),
                  ElevatedButton(
                      onPressed: cancel, child: const Text('Cancel')),
                ],
              ));
    }

    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: addExpense,
        elevation: 2.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Consumer(builder: (context, ref, child) {
        List<ExpenseItem> value =
            ref.watch(expenseDataProvider).fullExpenseList;
        return ListView(
          children: [
            // weekly summary bar chart
            
            // expense list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) =>
                  ExpenseTile(expense: value[index]))
          ]
        );
      }),
    );
  }
}