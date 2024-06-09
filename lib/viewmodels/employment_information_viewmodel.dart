import 'package:credit_score_check/repositories/employment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/employment_information_model.dart';

class EmploymentInformationViewModel
    extends StateNotifier<AsyncValue<EmploymentInformationModel>> {
  EmploymentInformationViewModel({
    required this.employmentRepository,
  }) : super(const AsyncValue.loading());

  final EmploymentRepository employmentRepository;

  late EmploymentInformationModel _backupModel;

  Future<void> loadInitialData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final data = await employmentRepository.loadEmploymentInformation();
      _backupModel = data;
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> update() async {
    try {
      final updatedModel = state.asData!.value;
      state = const AsyncValue.loading();
      await Future.delayed(const Duration(seconds: 1));
      await employmentRepository.saveEmploymentInformation(updatedModel);
      _backupModel = updatedModel;
      state = AsyncValue.data(updatedModel);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
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
    final updatedModel = state.asData!.value.copyWith(
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
    state = AsyncValue.data(updatedModel);
  }

  void rollback() {
    state = AsyncValue.data(_backupModel);
  }
}

final employmentInformationProvider = StateNotifierProvider<
    EmploymentInformationViewModel,
    AsyncValue<EmploymentInformationModel>>((ref) {
  final employmentRepository = ref.read(employmentRepositoryProvider);
  final viewModel = EmploymentInformationViewModel(
    employmentRepository: employmentRepository,
  );
  viewModel.loadInitialData();
  return viewModel;
});
