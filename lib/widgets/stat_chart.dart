import 'package:covid_app/configs/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class StatChart extends StatelessWidget {
  final List<int>? data;

  StatChart({Key? key, this.data}) : super(key: key);

  final List<Color> _gradientColors = [
    graphGradientStart.withOpacity(.5),
    graphGradientEnd.withOpacity(0),
  ];

  List<int> _getDefaultData() => [for (int i = 1; i < 8; i++) 0];

  List<FlSpot> _getSpots() {
    final dataToSpots = data ?? _getDefaultData();

    return dataToSpots
        .mapIndexed((index, element) => FlSpot(index + 1, element.toDouble()))
        .toList();
  }

  String _getTitleByX(int xValue) {
    final now = DateTime.now();
    final xValueDuration = Duration(days: 7 - xValue);
    final dateByValue = now.subtract(xValueDuration);
    return DateFormat('EEE').format(dateByValue);
  }

  String _getValueTitle(int value) {
    final formattedNumber = NumberFormat.compact().format(value);

    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.56,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map(
                (spotIndex) {
                  return TouchedSpotIndicatorData(
                    FlLine(color: white, strokeWidth: 0.5),
                    FlDotData(
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: accent,
                          strokeWidth: 5,
                          strokeColor: white,
                        );
                      },
                    ),
                  );
                },
              ).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                return lineBarsSpot.map(
                  (lineBarSpot) {
                    return LineTooltipItem(
                      _getValueTitle(lineBarSpot.y.toInt()),
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                    );
                  },
                ).toList();
              },
            ),
          ),
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
              margin: 10,
              reservedSize: 22,
              getTextStyles: (context, _) =>
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
              interval: 1,
              getTitles: (value) {
                return _getTitleByX(value.toInt());
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
              rotateAngle: 0,
              margin: 5,
              getTextStyles: (context, _) =>
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
              getTitles: (value) {
                return _getValueTitle(value.toInt());
              },
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
          minX: 1,
          maxX: 7,
          minY: data != null
              ? data!.reduce(min).toDouble() -
                  data!.reduce(max).toDouble() * .03
              : 0,
          maxY: data != null && data!.reduce(max).toDouble() != 0
              ? data!.reduce(max).toDouble()
              : 1000000,
          lineBarsData: [
            LineChartBarData(
              spots: _getSpots(),
              isCurved: true,
              colors: [graphGradientStart.withOpacity(.5)],
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: _gradientColors,
                gradientTo: const Offset(.5, 1.75),
                gradientFrom: const Offset(.5, 0),
              ),
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
