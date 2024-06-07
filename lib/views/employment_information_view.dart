import 'package:credit_score_check/widgets/custom_date_field.dart';
import 'package:credit_score_check/widgets/custom_dropdown_field.dart';
import 'package:credit_score_check/widgets/custom_text_field.dart';
import 'package:credit_score_check/widgets/custom_time_employer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/employment_information_viewmodel.dart';
import '../widgets/custom_radio_item.dart';
import '../widgets/feedback_form.dart';

final _formKey = GlobalKey<FormState>();

class EmploymentInformation extends ConsumerStatefulWidget {
  const EmploymentInformation({super.key});

  @override
  _EmploymentInformationState createState() => _EmploymentInformationState();
}

class _EmploymentInformationState extends ConsumerState<EmploymentInformation> {
  bool isEditing = false;

  @override
  void dispose() {
    if (isEditing) {
      ref.read(employmentInformationProvider.notifier).rollback();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employmentInfo = ref.watch(employmentInformationProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
            if (isEditing) {
              ref.read(employmentInformationProvider.notifier).rollback();
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing
                      ? 'Edit employment information'
                      : 'Confirm your employment',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (!isEditing)
                  Text(
                    'Please review and confirm the below employment details are up-to-date.',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                buildDetailItem(
                    'Employment type', employmentInfo.employmentType),
                buildDetailItem('Employer', employmentInfo.employer),
                buildDetailItem('Job title', employmentInfo.jobTitle),
                buildDetailItem(
                    'Gross annual income', employmentInfo.grossAnnualIncome),
                buildDetailItem('Pay frequency', employmentInfo.payFrequency),
                buildDetailItem(
                    'Employer address', employmentInfo.employerAddress),
                buildDetailItem('Time with employer',
                    '${employmentInfo.timeWithEmployerYears} ${employmentInfo.timeWithEmployerMonths}'),
                buildDetailItem('Next payday', employmentInfo.nextPayday),
                buildDetailItem('Is your pay a direct deposit?',
                    employmentInfo.isDirectDeposit ? 'Yes' : 'No'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!isEditing)
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF4A148C)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 32),
                          child: Text(
                            'Edit',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A148C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        if (isEditing) {
                          final isFormFalid = _formKey.currentState!.validate();
                          if (!isFormFalid) {
                            return;
                          }
                          ref
                              .read(employmentInformationProvider.notifier)
                              .update();
                          setState(() {
                            isEditing = false;
                          });
                        } else {
                          Navigator.of(context).pop();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const FractionallySizedBox(
                                heightFactor: 0.5,
                                child: FeedbackForm(),
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A148C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 32),
                        child: Text(
                          isEditing ? 'Save' : 'Confirm',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailItem(String title, String value) {
    if (isEditing) {
      if (title == 'Employment type' || title == 'Pay frequency') {
        return CustomDropdownField(
            label: title,
            value: value,
            options: const ['Full-time', 'Part-time', 'Contract', 'Bi-weekly'],
            onChanged: (value) {
              setState(() {
                ref
                    .read(employmentInformationProvider.notifier)
                    .updateEmploymentInformation(
                      employmentType: title == 'Employment type' ? value : null,
                      payFrequency: title == 'Pay frequency' ? value : null,
                    );
              });
            });
      } else if (title == 'Next payday') {
        return CustomDateField(
          label: title,
          value: value,
          onChanged: (value) {
            setState(() {
              ref
                  .read(employmentInformationProvider.notifier)
                  .updateEmploymentInformation(
                    nextPayday: value,
                  );
            });
          },
        );
      } else if (title == 'Is your pay a direct deposit?') {
        return CustomRadioItem(
          label: title,
          option1: 'Yes',
          option2: 'No',
          groupValue: ref.watch(employmentInformationProvider).isDirectDeposit,
          onChanged: (value) {
            setState(() {
              ref
                  .read(employmentInformationProvider.notifier)
                  .updateEmploymentInformation(
                    isDirectDeposit: value,
                  );
            });
          },
        );
      } else if (title == 'Time with employer') {
        return CustomTimeEmployer(
          onChangedYears: (value) {
            setState(() {
              ref
                  .read(employmentInformationProvider.notifier)
                  .updateEmploymentInformation(
                    timeWithEmployerYears: value,
                  );
            });
          },
          onChangedMonth: (value) {
            setState(() {
              ref
                  .read(employmentInformationProvider.notifier)
                  .updateEmploymentInformation(
                    timeWithEmployerMonths: value,
                  );
            });
          },
          valueYears:
              ref.watch(employmentInformationProvider).timeWithEmployerYears,
          valueMonth:
              ref.watch(employmentInformationProvider).timeWithEmployerMonths,
        );
      } else {
        return CustomTextField(
          label: title,
          value: value,
          onChanged: (value) {
            setState(() {
              ref
                  .read(employmentInformationProvider.notifier)
                  .updateEmploymentInformation(
                    employer: title == 'Employer' ? value : null,
                    jobTitle: title == 'Job title' ? value : null,
                    grossAnnualIncome:
                        title == 'Gross annual income' ? value : null,
                    employerAddress: title == 'Employer address' ? value : null,
                  );
            });
          },
        );
      }
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
