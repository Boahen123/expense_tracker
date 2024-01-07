import 'package:flutter/material.dart';

class CurrencyData extends ChangeNotifier {
  /// Currency symbol; default is GHS
  String currencyName = 'Ghana Cedis';
  String currencySymbol = 'GHS';

  void changeName(String newName, String newSymbol) {
    currencyName = '$newName ($newSymbol)';
    currencySymbol = newSymbol;
    notifyListeners();
  }
}
