import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRadioItem extends StatelessWidget {
  const CustomRadioItem({
    super.key,
    required this.label,
    required this.groupValue,
    required this.onChanged,
    required this.option1,
    required this.option2,
  });
  final String label;
  final bool? groupValue;
  final String option1;
  final String option2;
  final Function(bool?) onChanged;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
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
                child: RadioListTile(
                  value: true,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  title: Text(option1),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: false,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  title: Text(option2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
