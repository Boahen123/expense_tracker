import 'package:expense_tracker/data/bar_graph/single_bar.dart';

class BarData {
  /// amounts for each day
  final double sun;
  final double mon;
  final double tue;
  final double wed;
  final double thurs;
  final double fri;
  final double sat;


  BarData({
    required this.sun,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thurs,
    required this.fri,
    required this.sat,
  });

  List<SingleBar> barInfo = [];

  /// initialize the bar info
  void initializeBarInfo() {
    barInfo = [
      SingleBar(x: 0, amount: sun),
      SingleBar(x: 1, amount: mon),
      SingleBar(x: 2, amount: tue),
      SingleBar(x: 3, amount: wed),
      SingleBar(x: 4, amount: thurs),
      SingleBar(x: 5, amount: fri),
      SingleBar(x: 6, amount: sat),
    ];
  }
}
