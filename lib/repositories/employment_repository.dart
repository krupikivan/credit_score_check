import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/employment_information_model.dart';
import '../services/storage_service.dart';

final employmentRepositoryProvider = Provider<EmploymentRepository>(
  (ref) => EmploymentRepository(
    storageService: ref.read(storageServiceProvider),
  ),
);

class EmploymentRepository {
  final StorageService storageService;

  const EmploymentRepository({
    required this.storageService,
  });

  Future<void> saveEmploymentInformation(
    EmploymentInformationModel model,
  ) async {
    await storageService.saveEmploymentInformation(model);
  }

  Future<EmploymentInformationModel> loadEmploymentInformation() async {
    try {
      final data = await storageService.loadEmploymentInformation();
      if (data == null) {
        return EmploymentInformationModel.initializer();
      }
      return EmploymentInformationModel.fromJson(data);
    } catch (e) {
      throw Exception('Error loading data: $e');
    }
  }
}
