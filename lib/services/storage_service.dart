import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/employment_information_model.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  final storageService = StorageService();
  ref.onDispose(() {});
  return storageService;
});

final storageServiceInitializationProvider = FutureProvider<void>((ref) async {
  final storageService = ref.read(storageServiceProvider);
  await storageService.initialize();
});

class StorageService {
  late final SharedPreferences prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveEmploymentInformation(
    EmploymentInformationModel model,
  ) async {
    await prefs.setString(
        'employmentInformationModel', jsonEncode(model.toJson()));
  }

  Future<Map<String, dynamic>?> loadEmploymentInformation() async {
    String? model = prefs.getString('employmentInformationModel');
    if (model == null) {
      return null;
    }
    return jsonDecode(model);
  }
}
