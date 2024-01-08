import 'package:expense_tracker/data/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Class for the Bar Graph
class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sun;
  final double mon;
  final double tue;
  final double wed;
  final double thurs;
  final double fri;
  final double sat;

  const BarGraph(
      {super.key,
      this.maxY,
      required this.sun,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thurs,
      required this.fri,
      required this.sat});

  @override
  Widget build(BuildContext context) {
    // initialize the bar info
    BarData mybarInfo = BarData(
      sunAmount: sun,
      monAmount: mon,
      tueAmount: tue,
      wedAmount: wed,
      thursAmount: thurs,
      friAmount: fri,
      satAmount: sat,
    );
    mybarInfo.initializeBarInfo();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      barGroups: mybarInfo.getBarInfo
          .map((bar) => BarChartGroupData(x: bar.day, barRods: [
                BarChartRodData(
                  toY: bar.amount,
                  color: Colors.grey[800],
                  width: 15,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxY,
                    color: Colors.grey[200],
                  ),
                )
              ]))
          .toList(),
    ));
  }
}
