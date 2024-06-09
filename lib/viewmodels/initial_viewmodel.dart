import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/storage_service.dart';
import '../utils/enum.dart';

class InitialViewModel extends StateNotifier<AsyncValue<AppState>> {
  InitialViewModel({
    required this.ref,
  }) : super(const AsyncValue.data(AppState.loading));
  final Ref ref;

  Future<void> initializeApp() async {
    try {
      await ref.read(storageServiceInitializationProvider.future);
      state = const AsyncValue.data(AppState.loaded);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final initialViewModelProvider =
    StateNotifierProvider<InitialViewModel, AsyncValue<AppState>>((ref) {
  final viewModel = InitialViewModel(
    ref: ref,
  );
  viewModel.initializeApp();
  return viewModel;
});
