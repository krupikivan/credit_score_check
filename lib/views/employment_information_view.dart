import 'package:credit_score_check/widgets/custom_date_field.dart';
import 'package:credit_score_check/widgets/custom_dropdown_field.dart';
import 'package:credit_score_check/widgets/custom_text_field.dart';
import 'package:credit_score_check/widgets/custom_time_employer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/employment_information_model.dart';
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
        body: employmentInfo.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('An error occurred'),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(employmentInformationProvider.notifier)
                        .loadInitialData();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (data) => Padding(
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
                        'Employment type', data.employmentType, data),
                    buildDetailItem('Employer', data.employer, data),
                    buildDetailItem('Job title', data.jobTitle, data),
                    buildDetailItem(
                        'Gross annual income', data.grossAnnualIncome, data),
                    buildDetailItem('Pay frequency', data.payFrequency, data),
                    buildDetailItem(
                        'Employer address', data.employerAddress, data),
                    buildDetailItem(
                        'Time with employer',
                        '${data.timeWithEmployerYears} ${data.timeWithEmployerMonths}',
                        data),
                    buildDetailItem('Next payday', data.nextPayday, data),
                    buildDetailItem('Is your pay a direct deposit?',
                        data.isDirectDeposit ? 'Yes' : 'No', data),
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
                          onPressed: () async {
                            if (isEditing) {
                              final isFormFalid =
                                  _formKey.currentState!.validate();
                              if (!isFormFalid) {
                                return;
                              }
                              await ref
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
        ));
  }

  Widget buildDetailItem(
      String title, String value, EmploymentInformationModel data) {
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
          groupValue: data.isDirectDeposit,
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
          valueYears: data.timeWithEmployerYears,
          valueMonth: data.timeWithEmployerMonths,
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
