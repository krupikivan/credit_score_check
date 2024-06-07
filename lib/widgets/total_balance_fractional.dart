import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/enum.dart';

class TotalBalanceFractional extends StatelessWidget {
  const TotalBalanceFractional({
    super.key,
    required this.score,
    required this.value,
    required this.width,
  });
  final ScoreReputation score;
  final double value;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width / 3,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: utilizationColor.withOpacity(0.7),
      ),
    );
  }

  String get utilizationText {
    if (score == ScoreReputation.excellent) {
      return 'Excellent';
    } else if (score == ScoreReputation.good) {
      return 'Good';
    } else {
      return 'Poor';
    }
  }

  Color get utilizationColor {
    if (score == ScoreReputation.excellent) {
      return const Color(0xFF48A388);
    } else if (score == ScoreReputation.good) {
      return const Color(0xFFFF7E17);
    } else {
      return const Color(0xFFDD1338);
    }
  }

  BorderRadiusGeometry? get borderRadius {
    if (score == ScoreReputation.excellent) {
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      );
    } else if (score == ScoreReputation.good) {
      return null;
    } else {
      return const BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
      );
    }
  }
}
