import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/employment_information_model.dart';

class EmploymentInformationViewModel
    extends StateNotifier<EmploymentInformationModel> {
  EmploymentInformationViewModel()
      : super(EmploymentInformationModel.initializer());

  EmploymentInformationModel _backupModel =
      EmploymentInformationModel.initializer();

  void update() {
    // Handle API call here
    _backupModel = state;
  }

  void updateEmploymentInformation({
    String? employmentType,
    String? employer,
    String? jobTitle,
    String? grossAnnualIncome,
    String? payFrequency,
    String? employerAddress,
    String? timeWithEmployerYears,
    String? timeWithEmployerMonths,
    String? nextPayday,
    bool? isDirectDeposit,
  }) {
    state = state.copyWith(
      employmentType: employmentType,
      employer: employer,
      jobTitle: jobTitle,
      grossAnnualIncome: grossAnnualIncome,
      payFrequency: payFrequency,
      employerAddress: employerAddress,
      timeWithEmployerYears: timeWithEmployerYears,
      timeWithEmployerMonths: timeWithEmployerMonths,
      nextPayday: nextPayday,
      isDirectDeposit: isDirectDeposit,
    );
  }

  void rollback() {
    state = _backupModel;
  }
}

final employmentInformationProvider = StateNotifierProvider<
    EmploymentInformationViewModel, EmploymentInformationModel>(
  (ref) => EmploymentInformationViewModel(),
);
