import 'package:credit_score_check/views/home_view.dart';
import 'package:credit_score_check/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../views/employment_information_view.dart';
import '../views/initial_view.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const InitialView());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomeView());
    case '/employment-information':
      return MaterialPageRoute(builder: (_) => const EmploymentInformation());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
