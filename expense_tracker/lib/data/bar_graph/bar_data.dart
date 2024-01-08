import 'package:expense_tracker/data/bar_graph/single_bar.dart';

/// Bar data for the bar graph
class BarData {
  /// amounts for each day
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thursAmount;
  final double friAmount;
  final double satAmount;


  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thursAmount,
    required this.friAmount,
    required this.satAmount,
  });

  /// List to store the bar info - i.e. the amount spent on each day
  List<SingleBar> barInfo = [];

  /// Getter to get bar info
  List<SingleBar> get getBarInfo => barInfo;

  /// initialize the bar info for each day of the week
  void initializeBarInfo() {
     barInfo = [
      SingleBar(day: 0, amount: sunAmount),
      SingleBar(day: 1, amount: monAmount),
      SingleBar(day: 2, amount: tueAmount),
      SingleBar(day: 3, amount: wedAmount),
      SingleBar(day: 4, amount: thursAmount),
      SingleBar(day: 5, amount: friAmount),
      SingleBar(day: 6, amount: satAmount),
    ];
  }
}
