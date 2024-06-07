import 'package:credit_score_check/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnimatedCircle extends StatefulWidget {
  final int value;
  final int minValue;
  final bool isPercent;
  final int maxValue;
  final String label;

  const AnimatedCircle({
    super.key,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.label,
    this.isPercent = false,
  });

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: widget.value / 1000),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 6.0,
                percent: normalizeCreditScore(
                    widget.value, widget.minValue, widget.maxValue),
                animationDuration: 2000,
                animation: true,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.value.toString() + (widget.isPercent ? '%' : ''),
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      widget.label,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: const Color(0xFFA9EACE),
                progressColor: const Color(0xFF48A388),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              // SizedBox(
              //   width: 100,
              //   height: 100,
              //   child: CircularProgressIndicator(
              //     value: value,
              //     strokeWidth: 10,
              //     backgroundColor: const Color(0xFFA9EACE),
              //     valueColor:
              //         const AlwaysStoppedAnimation<Color>(Color(0xFF48A388)),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
