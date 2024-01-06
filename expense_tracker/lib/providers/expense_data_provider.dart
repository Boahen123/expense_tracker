import 'package:expense_tracker/data/expense_data.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseDataProvider = ChangeNotifierProvider<ExpenseData>((ref) {
  return ExpenseData();
});
