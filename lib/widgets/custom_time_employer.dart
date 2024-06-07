import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTimeEmployer extends StatelessWidget {
  const CustomTimeEmployer({
    super.key,
    required this.onChangedYears,
    required this.onChangedMonth,
    required this.valueYears,
    required this.valueMonth,
  });
  final Function(String?) onChangedYears;
  final Function(String?) onChangedMonth;
  final String valueYears;
  final String valueMonth;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time with employer',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: valueYears,
                  items: ['0 year', '1 year', '2 years'].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: onChangedYears,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: valueMonth,
                  items:
                      ['0 month', '3 months', '6 months'].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: onChangedMonth,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
