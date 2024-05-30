import 'package:flutter/material.dart';
import 'package:phone_maintenance/features/services/screens/services_screen.dart';

class AppRoutes {
  AppRoutes._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ServiceListScreen());

      default:
        return null;
    }
  }
}
