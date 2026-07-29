import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductionLineChart extends StatelessWidget {
  final double line1;
  final double line2;
  final double line3;

  const ProductionLineChart({
    super.key,
    required this.line1,
    required this.line2,
    required this.line3,
  });

  @override
  Widget build(BuildContext context) {
    double maxValue = [line1, line2, line3].reduce((a, b) => a > b ? a : b);
    double chartMaxY = maxValue == 0 ? 10 : maxValue * 1.2;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
        border: const Border(bottom: BorderSide(color: Colors.blue, width: 4)),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Production by Line",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    maxY: chartMaxY,

                    gridData: FlGridData(show: true, drawVerticalLine: false),

                    borderData: FlBorderData(show: false),

                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 38,
                          interval: chartMaxY / 3,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) {
                              return const Text("0");
                            }

                            return Text(
                              "${(value / 1000).toStringAsFixed(0)}K",
                              style: const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),

                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text("Line 1");
                              case 1:
                                return const Text("Line 2");
                              case 2:
                                return const Text("Line 3");
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),

                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: line1,
                            width: 28,
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.blue,
                          ),
                        ],
                      ),

                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: line2,
                            width: 28,
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.orange,
                          ),
                        ],
                      ),

                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: line3,
                            width: 28,
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
