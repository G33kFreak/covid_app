import 'package:covid_app/configs/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatChart extends StatelessWidget {
  StatChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    graphGradientStart.withOpacity(.5),
    graphGradientEnd.withOpacity(0),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.26,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: lines,
                strokeWidth: .55,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              interval: 1,
              getTextStyles: (context, value) =>
                  Theme.of(context).textTheme.bodyText1,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return 'MAR';
                  case 5:
                    return 'JUN';
                  case 8:
                    return 'SEP';
                }
                return '';
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTextStyles: (context, value) =>
                  Theme.of(context).textTheme.bodyText1,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return '10k';
                  case 3:
                    return '30k';
                  case 5:
                    return '50k';
                }
                return '';
              },
              reservedSize: 30,
              margin: 8,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: lines, width: .55),
              left: BorderSide(color: Colors.transparent),
              right: BorderSide(color: Colors.transparent),
              top: BorderSide(color: Colors.transparent),
            ),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              colors: [graphGradientStart.withOpacity(.5)],
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors,
                gradientTo: const Offset(.5, 1.75),
                gradientFrom: const Offset(.5, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
