import 'package:credit_score_check/utils/enum.dart';
import 'package:credit_score_check/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/initial_viewmodel.dart';
import 'error_view.dart';
import 'splash_view.dart';

class InitialView extends ConsumerWidget {
  const InitialView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(initialViewModelProvider);
    return appState.when(
      data: (data) {
        switch (data) {
          case AppState.loaded:
            return const HomeView();
          case AppState.error:
            return const ErrorView();
          default:
            return const SplashView();
        }
      },
      loading: () => const SplashView(),
      error: (e, trace) => const ErrorView(),
    );
  }
}
