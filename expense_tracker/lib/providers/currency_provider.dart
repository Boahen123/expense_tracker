import 'package:expense_tracker/data/currency_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currencyProvider = ChangeNotifierProvider<CurrencyData>((ref) {
  return CurrencyData();
});
