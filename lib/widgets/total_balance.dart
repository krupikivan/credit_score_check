import 'package:credit_score_check/widgets/animated_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/enum.dart';
import 'total_balance_fractional.dart';

class TotalBalance extends StatelessWidget {
  final double totalBalance;
  final double totalLimit;

  const TotalBalance({
    super.key,
    required this.totalBalance,
    required this.totalLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Total balance: ',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '\$${totalBalance.toInt()}',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: utilizationColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total limit: \$${totalLimit.toInt()}',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedCircle(
                value: utilization.ceil(),
                isPercent: true,
                label: utilizationText,
                minValue: 0,
                maxValue: 200900,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: alignment,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  utilizationText,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: utilizationColor,
                    ),
                  ),
                ),
              ),
              LayoutBuilder(builder: (context, constraint) {
                return Stack(
                  children: [
                    Row(
                      children: [
                        TotalBalanceFractional(
                          score: ScoreReputation.excellent,
                          value: utilization,
                          width: constraint.maxWidth,
                        ),
                        TotalBalanceFractional(
                          score: ScoreReputation.good,
                          value: utilization,
                          width: constraint.maxWidth,
                        ),
                        TotalBalanceFractional(
                          value: utilization,
                          score: ScoreReputation.poor,
                          width: constraint.maxWidth,
                        ),
                      ],
                    ),
                    FractionallySizedBox(
                      widthFactor: utilization / 75,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0-9%',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: percentColor(0, 9),
                  ),
                ),
              ),
              Text(
                '10-29%',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: percentColor(10, 29),
                  ),
                ),
              ),
              Text(
                '30-49%',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: percentColor(30, 49),
                  ),
                ),
              ),
              Text(
                '50-74%',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: percentColor(50, 74),
                  ),
                ),
              ),
              Text(
                '<75%',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: percentColor(75, 100),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CrossAxisAlignment get alignment {
    if (utilization < 30) {
      return CrossAxisAlignment.start;
    } else if (utilization < 50) {
      return CrossAxisAlignment.center;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  String get utilizationText {
    if (utilization < 30) {
      return 'Excellent';
    } else if (utilization < 50) {
      return 'Good';
    } else {
      return 'Poor';
    }
  }

  double get utilization => (totalBalance / totalLimit) * 100;

  Color percentColor(double min, double max) {
    double utilization = (totalBalance / totalLimit) * 100;
    if (utilization >= min && utilization <= max) {
      return utilizationColor;
    }
    return Colors.grey;
  }

  Color get utilizationColor {
    if (utilization <= 9) {
      return const Color(0xFF48A388);
    } else if (utilization <= 29) {
      return const Color(0xFF48A388);
    } else if (utilization <= 49) {
      return const Color(0xFFFF7E17);
    } else if (utilization <= 74) {
      return const Color(0xFFDD1338);
    } else {
      return const Color(0xFFDD1338);
    }
  }
}
