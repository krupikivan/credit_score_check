import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditFactors extends StatelessWidget {
  const CreditFactors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credit factors',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CreditFactorCard(
                title: 'Payment History',
                value: '100%',
                impact: 'HIGH IMPACT',
                impactColor: Color(0xFF003928),
                impactTextColor: Colors.white,
              ),
              CreditFactorCard(
                title: 'Credit Card Utilization',
                value: '4%',
                impact: 'LOW IMPACT',
                impactColor: Color(0xFFA9EACE),
                impactTextColor: Colors.black,
              ),
              CreditFactorCard(
                title: 'Derogatory Marks',
                value: '1',
                impact: 'MEDIUM IMPACT',
                impactColor: Color(0xFF48A388),
                impactTextColor: Colors.white,
              ),
              // Add more cards as needed
            ],
          ),
        ),
      ],
    );
  }
}

class CreditFactorCard extends StatelessWidget {
  final String title;
  final String value;
  final String impact;
  final Color impactTextColor;
  final Color impactColor;

  const CreditFactorCard({
    super.key,
    required this.title,
    required this.value,
    required this.impact,
    required this.impactTextColor,
    required this.impactColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF420085),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: impactColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                impact,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: impactTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
