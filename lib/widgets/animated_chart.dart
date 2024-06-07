import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedChart extends StatelessWidget {
  const AnimatedChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Score',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Updated Today',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF736B7C),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Next May 12',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF736B7C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Experian',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.purple,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(showTitles: false),
                  leftTitles: SideTitles(showTitles: true, reservedSize: 28),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    left: BorderSide.none,
                    right: BorderSide.none,
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                minX: 0,
                maxX: 11,
                minY: 600,
                maxY: 750,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 620),
                      const FlSpot(1, 610),
                      const FlSpot(2, 600),
                      const FlSpot(3, 650),
                      const FlSpot(4, 640),
                      const FlSpot(5, 660),
                      const FlSpot(6, 650),
                      const FlSpot(7, 660),
                      const FlSpot(8, 650),
                      const FlSpot(9, 640),
                      const FlSpot(10, 660),
                      const FlSpot(11, 700),
                    ],
                    isCurved: false,
                    colors: [const Color(0xFF48A388)],
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white,
                          strokeWidth: 2,
                          strokeColor: const Color(0xFF48A388),
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
              swapAnimationDuration: const Duration(milliseconds: 250),
              swapAnimationCurve: Curves.linear,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Last 12 months',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            'Score calculated using VantageScore 3.0',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
